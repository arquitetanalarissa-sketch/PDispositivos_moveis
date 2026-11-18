class Viagem {
  final int? id;
  final String destino;
  final String data;
  final double orcamento;
  final bool concluida;

  Viagem({
    this.id,
    required this.destino,
    required this.data,
    required this.orcamento,
    this.concluida = false,
  });

  // Converte o objeto Viagem para Map (para salvar no SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'destino': destino,
      'data': data,
      'orcamento': orcamento,
      'concluida': concluida ? 1 : 0, // SQLite usa 1 para true e 0 para false
    };
  }

  // Converte o Map vindo do SQLite de volta para objeto Viagem
  factory Viagem.fromMap(Map<String, dynamic> map) {
    return Viagem(
      id: map['id'] as int?,
      destino: map['destino'] as String,
      data: map['data'] as String,
      orcamento: (map['orcamento'] as num).toDouble(),
      concluida: (map['concluida'] as int) == 1,
    );
  }
}
