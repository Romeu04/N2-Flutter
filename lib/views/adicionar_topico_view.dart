// lib/views/adicionar_topico_view.dart
import 'package:flutter/material.dart';
import 'package:n2_tassiana/utils/cores.dart';
import 'package:provider/provider.dart';
import '../viewmodels/topico_viewmodel.dart';
import '../models/topico_model.dart';
import '../widgets/campo_texto_personalizado.dart';
import '../widgets/botao_personalizado.dart';
import '../widgets/seletor_prioridade.dart';

class AdicionarTopicoView extends StatefulWidget {
  @override
  _AdicionarTopicoViewState createState() => _AdicionarTopicoViewState();
}

class _AdicionarTopicoViewState extends State<AdicionarTopicoView> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  String _prioridadeSelecionada = 'Baixa';

  @override
  Widget build(BuildContext context) {
    final topicoVM = Provider.of<TopicoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tópico'),
        backgroundColor: Cores.primaria,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CampoTextoPersonalizado(
                hintText: 'Nome do Tópico',
                controller: _nomeController,
              ),
              SizedBox(height: 16),
              CampoTextoPersonalizado(
                hintText: 'Descrição',
                controller: _descricaoController,
              ),
              SizedBox(height: 16),
              SeletorPrioridade(
                prioridadeSelecionada: _prioridadeSelecionada,
                onChanged: (valor) {
                  setState(() {
                    _prioridadeSelecionada = valor!;
                  });
                },
              ),
              SizedBox(height: 16),
              BotaoPersonalizado(
                texto: 'Salvar',
                onPressed: () async {
                  if (_nomeController.text.isEmpty ||
                      _descricaoController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Preencha todos os campos.')),
                    );
                    return;
                  }

                  Topico novoTopico = Topico(
                    nome: _nomeController.text.trim(),
                    descricao: _descricaoController.text.trim(),
                    prioridade: _prioridadeSelecionada,
                    dataCriacao: DateTime.now(),
                  );

                  await topicoVM.adicionarTopico(novoTopico);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
