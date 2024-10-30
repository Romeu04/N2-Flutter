// lib/models/topico_model.dart
class Topico {
  String? id;
  String nome;
  String descricao;
  String prioridade;
  DateTime dataCriacao;

  Topico({
    this.id,
    required this.nome,
    required this.descricao,
    required this.prioridade,
    required this.dataCriacao,
  });

  // Converte um documento do Firestore em um objeto Topico
  factory Topico.fromMap(Map<String, dynamic> data, String documentId) {
    return Topico(
      id: documentId,
      nome: data['nome'] ?? '',
      descricao: data['descricao'] ?? '',
      prioridade: data['prioridade'] ?? 'Baixa',
      dataCriacao: data['dataCriacao'].toDate(),
    );
  }

  // Converte um objeto Topico em um mapa para salvar no Firestore
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'descricao': descricao,
      'prioridade': prioridade,
      'dataCriacao': dataCriacao,
    };
  }
}
