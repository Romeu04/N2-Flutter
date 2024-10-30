// lib/views/editar_topico_view.dart
import 'package:flutter/material.dart';
import 'package:n2_tassiana/utils/cores.dart';
import 'package:provider/provider.dart';
import '../viewmodels/topico_viewmodel.dart';
import '../models/topico_model.dart';
import '../widgets/campo_texto_personalizado.dart';
import '../widgets/botao_personalizado.dart';
import '../widgets/seletor_prioridade.dart';

class EditarTopicoView extends StatefulWidget {
  final Topico topico;

  const EditarTopicoView({Key? key, required this.topico}) : super(key: key);

  @override
  _EditarTopicoViewState createState() => _EditarTopicoViewState();
}

class _EditarTopicoViewState extends State<EditarTopicoView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _descricaoController;
  late String _prioridadeSelecionada;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.topico.nome);
    _descricaoController = TextEditingController(text: widget.topico.descricao);
    _prioridadeSelecionada = widget.topico.prioridade;
  }

  @override
  Widget build(BuildContext context) {
    final topicoVM = Provider.of<TopicoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Tópico'),
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
                texto: 'Atualizar',
                onPressed: () async {
                  if (_nomeController.text.isEmpty ||
                      _descricaoController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Preencha todos os campos.')),
                    );
                    return;
                  }

                  Topico topicoAtualizado = Topico(
                    id: widget.topico.id,
                    nome: _nomeController.text.trim(),
                    descricao: _descricaoController.text.trim(),
                    prioridade: _prioridadeSelecionada,
                    dataCriacao: widget.topico.dataCriacao,
                  );

                  await topicoVM.atualizarTopico(topicoAtualizado);
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
