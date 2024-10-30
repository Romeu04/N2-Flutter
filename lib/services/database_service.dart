// lib/services/database_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/topico_model.dart';

class DatabaseService {
  final CollectionReference _topicosCollection =
      FirebaseFirestore.instance.collection('topicos');

  // Adicionar novo tópico
  Future<void> adicionarTopico(Topico topico) async {
    await _topicosCollection.add(topico.toMap());
  }

  // Atualizar tópico existente
  Future<void> atualizarTopico(Topico topico) async {
    await _topicosCollection.doc(topico.id).update(topico.toMap());
  }

  // Excluir tópico
  Future<void> excluirTopico(String id) async {
    await _topicosCollection.doc(id).delete();
  }

  // Obter lista de tópicos
  Stream<List<Topico>> get topicos {
    return _topicosCollection
        .orderBy('dataCriacao', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Topico.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
