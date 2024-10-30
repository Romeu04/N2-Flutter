// lib/viewmodels/topico_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/topico_model.dart';
import '../services/database_service.dart';

class TopicoViewModel extends ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();

  List<Topico> _topicos = [];
  List<Topico> get topicos => _topicos;

  String? _filtroPrioridade;
  String? get filtroPrioridade => _filtroPrioridade;

  // Atualizar o filtro de prioridade
  void atualizarFiltro(String? prioridade) {
    _filtroPrioridade = prioridade;
    notifyListeners();
  }

  // Iniciar o stream dos tópicos
  void iniciar() {
    _dbService.topicos.listen((topicos) {
      _topicos = topicos;
      notifyListeners();
    });
  }

  // Operações CRUD
  Future<void> adicionarTopico(Topico topico) async {
    await _dbService.adicionarTopico(topico);
  }

  Future<void> atualizarTopico(Topico topico) async {
    await _dbService.atualizarTopico(topico);
  }

  Future<void> excluirTopico(String id) async {
    await _dbService.excluirTopico(id);
  }
}
