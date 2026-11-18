import 'package:flutter/material.dart';
import 'database/database_helper.dart';
import 'models/viagem_model.dart';

void main() async {
  // Obrigatório antes de usar o SQLite
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaViagens(),
  ));
}

class TelaViagens extends StatefulWidget {
  const TelaViagens({super.key});

  @override
  State<TelaViagens> createState() => _TelaViagensState();
}

class _TelaViagensState extends State<TelaViagens> {
  List<Viagem> _viagens = [];

  @override
  void initState() {
    super.initState();
    _carregarViagens();
  }

  Future<void> _carregarViagens() async {
    final lista = await DatabaseHelper.instance.listarViagens();
    setState(() {
      _viagens = lista;
    });
  }

  void _abrirDialogoNovaViagem() {
    final destinoCtrl = TextEditingController();
    final dataCtrl = TextEditingController();
    final orcamentoCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nova Viagem'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: destinoCtrl,
              decoration:
                  const InputDecoration(labelText: 'Destino (ex: Paris)'),
            ),
            TextField(
              controller: dataCtrl,
              decoration:
                  const InputDecoration(labelText: 'Data (ex: 15/12/2026)'),
            ),
            TextField(
              controller: orcamentoCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Orçamento (R\$)'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (destinoCtrl.text.isEmpty) return;

              final novaViagem = Viagem(
                destino: destinoCtrl.text,
                data: dataCtrl.text,
                orcamento: double.tryParse(orcamentoCtrl.text) ?? 0.0,
              );

              await DatabaseHelper.instance.inserirViagem(novaViagem);
              if (context.mounted) Navigator.pop(context);
              _carregarViagens();
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Viagens')),
      body: _viagens.isEmpty
          ? const Center(child: Text('Nenhuma viagem planejada ainda.'))
          : ListView.builder(
              itemCount: _viagens.length,
              itemBuilder: (context, index) {
                final viagem = _viagens[index];
                return ListTile(
                  leading: const Icon(Icons.flight_takeoff),
                  title: Text(viagem.destino),
                  subtitle: Text(
                      '${viagem.data} • R\$ ${viagem.orcamento.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await DatabaseHelper.instance.deletarViagem(viagem.id!);
                      _carregarViagens();
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirDialogoNovaViagem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
