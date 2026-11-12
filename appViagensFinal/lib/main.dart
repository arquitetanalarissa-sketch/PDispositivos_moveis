import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  final List perfisFicticios = const [
    {
      'nome': 'Mariana Silva',
      'cidade': 'São Paulo, SP',
      'viagens': '14 países visitados',
      'bio': 'Apaixonada por história antiga, arquitetura e cafés europeus.',
    },
    {
      'nome': 'Lucas Mendes',
      'cidade': 'Curitiba, PR',
      'viagens': '8 países visitados',
      'bio': 'Mochileiro de fim de semana e fotógrafo amador de paisagens.',
    },
    {
      'nome': 'Camila Costa',
      'cidade': 'Recife, PE',
      'viagens': '21 países visitados',
      'bio': 'Explorando a gastronomia local em cada destino pelo mundo.',
    },
    {
      'nome': 'Rafael Oliveira',
      'cidade': 'Belo Horizonte, MG',
      'viagens': '5 países visitados',
      'bio': 'Planejando o próximo roteiro pela Itália e Grécia.',
    },
  ];

  void _abrirTela(BuildContext context, Widget novaTela) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => novaTela),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viagens'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1552832230-c0197dd311b5?q=80&w=800&auto=format&fit=crop',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Roma',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          shadows: [
                            Shadow(blurRadius: 4, color: Colors.black54)
                          ],
                        ),
                      ),
                      Text(
                        'Coliseu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(blurRadius: 4, color: Colors.black54)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    Icons.location_on_outlined,
                    'Quero Ir',
                    () => _abrirTela(context, const TelaQueroIr()),
                  ),
                  _buildActionButton(
                    Icons.verified_outlined,
                    'Já Fui',
                    () => _abrirTela(context, const TelaJaFui()),
                  ),
                  _buildActionButton(
                    Icons.share,
                    'Compartilhar',
                    () => _abrirTela(context, const TelaCompartilhar()),
                  ),
                  _buildRatingButton(
                    'Avaliações',
                    () => _abrirTela(context, const TelaAvaliacoes()),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id diam id ligula ultricies pulvinar. In neque lectus, sagittis eu libero et, venenatis lacinia nulla. Etiam eget purus leo. Nam consectetur ornare est eu lobortis. Morbi eu augue eu lectus condimentum vestibulum. Etiam id nibh luctus, porttitor arcu et, porttitor purus. Pellentesque vulputate nibh sit amet rutrum viverra. Nullam eget metus est. Integer condimentum, odio sed congue malesuada, ipsum nisi bibendum lectus, quis porttitor ante lacus in mi. Curabitur eget imperdiet ante. Aliquam magna tortor, volutpat sit amet mi a, cursus malesuada leo. Aenean dolor erat, gravida ut ultricies sed, convallis nec ipsum.',
                style: TextStyle(fontSize: 13, height: 1.3),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pessoas Encontradas',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: const [
                        Icon(Icons.filter_alt,
                            color: Colors.lightBlue, size: 20),
                        Text(
                          'Filtrar',
                          style:
                              TextStyle(color: Colors.lightBlue, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  perfisFicticios.length,
                  (index) {
                    final perfil = perfisFicticios[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: () => _abrirTela(
                        context,
                        TelaPerfil(perfil: perfil),
                      ),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 28,
                            backgroundColor: Color(0xFFE0E0E0),
                            child: Icon(Icons.person,
                                size: 36, color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            perfil['nome']!.split(' ')[0],
                            style: const TextStyle(
                                fontSize: 11, color: Colors.black87),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  static Widget _buildActionButton(
      IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.lightBlue),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.lightBlue, fontSize: 12),
          ),
        ],
      ),
    );
  }

  static Widget _buildRatingButton(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.star, color: Colors.lightBlue, size: 18),
              Icon(Icons.star, color: Colors.lightBlue, size: 18),
              Icon(Icons.star, color: Colors.lightBlue, size: 18),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.lightBlue, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class TelaQueroIr extends StatelessWidget {
  const TelaQueroIr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Desejos'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, size: 72, color: Colors.lightBlue),
              SizedBox(height: 16),
              Text(
                'Coliseu - Roma',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Este destino foi adicionado à sua lista de lugares que você deseja visitar!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TelaJaFui extends StatelessWidget {
  const TelaJaFui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares Visitados'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.verified, size: 72, color: Colors.green),
              SizedBox(height: 16),
              Text(
                'Check-in realizado!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'O Coliseu agora faz parte do seu histórico de viagens concluídas.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TelaCompartilhar extends StatelessWidget {
  const TelaCompartilhar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compartilhar Destino'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            leading: Icon(Icons.message, color: Colors.green),
            title: Text('Enviar por WhatsApp'),
            subtitle: Text('Compartilhar roteiro de Roma com amigos'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email, color: Colors.redAccent),
            title: Text('Enviar por E-mail'),
            subtitle: Text('Mandar detalhes e fotos do Coliseu'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.link, color: Colors.blue),
            title: Text('Copiar Link'),
            subtitle: Text('https://appviagens.com/roma/coliseu'),
          ),
        ],
      ),
    );
  }
}

class TelaAvaliacoes extends StatelessWidget {
  const TelaAvaliacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliações do Destino'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.star, color: Colors.amber, size: 32),
              title: Text('Incrível e histórico!'),
              subtitle: Text(
                  'Por Mariana Silva • Recomendo comprar ingresso antecipado.'),
            ),
          ),
          SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.star, color: Colors.amber, size: 32),
              title: Text('Vale muito a visita'),
              subtitle: Text(
                  'Por Lucas Mendes • A vista no fim da tarde é espetacular.'),
            ),
          ),
          SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.star, color: Colors.amber, size: 32),
              title: Text('Passeio obrigatório em Roma'),
              subtitle: Text(
                  'Por Camila Costa • Guia turístico faz toda a diferença.'),
            ),
          ),
        ],
      ),
    );
  }
}

class TelaPerfil extends StatelessWidget {
  final Map<String, String> perfil;

  const TelaPerfil({super.key, required this.perfil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(perfil['nome']!),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.lightBlue,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(
                perfil['nome']!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                perfil['cidade']!,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 12),
              Chip(
                avatar: const Icon(Icons.flight_takeoff,
                    size: 18, color: Colors.blue),
                label: Text(perfil['viagens']!),
              ),
              const SizedBox(height: 20),
              Text(
                perfil['bio']!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, height: 1.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
