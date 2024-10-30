import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/topico_viewmodel.dart';
import '../models/topico_model.dart';
import '../utils/cores.dart';
import '../utils/constantes.dart';
import 'adicionar_topico_view.dart';
import 'editar_topico_view.dart';

class ListaTopicosView extends StatefulWidget {
  @override
  _ListaTopicosViewState createState() => _ListaTopicosViewState();
}

class _ListaTopicosViewState extends State<ListaTopicosView> {
  @override
  void initState() {
    super.initState();
    Provider.of<TopicoViewModel>(context, listen: false).iniciar();
  }

  @override
  Widget build(BuildContext context) {
    final topicoVM = Provider.of<TopicoViewModel>(context);

    // Filtrar tópicos com base na prioridade selecionada
    List<Topico> listaTopicos = topicoVM.topicos;
    if (topicoVM.filtroPrioridade != null) {
      listaTopicos = listaTopicos
          .where((topico) => topico.prioridade == topicoVM.filtroPrioridade)
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Tópicos de Estudo'),
        backgroundColor: Cores.primaria,
      ),
      body: Column(
        children: [
          // Filtro de prioridade
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: topicoVM.filtroPrioridade,
              items: [null, ...Constantes.listaPrioridades]
                  .map((String? prioridade) {
                return DropdownMenuItem<String>(
                  value: prioridade,
                  child: Text(
                    prioridade ?? 'Todas as Prioridades',
                    style: TextStyle(
                      color: prioridade != null
                          ? _getCorPrioridade(prioridade)
                          : Colors.black,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (valor) {
                topicoVM.atualizarFiltro(valor);
              },
              decoration: InputDecoration(
                labelText: 'Filtrar por Prioridade',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Lista de tópicos
          Expanded(
            child: listaTopicos.isEmpty
                ? Center(child: Text('Nenhum tópico encontrado.'))
                : ListView.builder(
                    itemCount: listaTopicos.length,
                    itemBuilder: (context, index) {
                      final topico = listaTopicos[index];
                      return ListTile(
                        title: Text(topico.nome),
                        subtitle: Text(topico.descricao),
                        trailing: Text(
                          topico.prioridade,
                          style: TextStyle(
                            color: _getCorPrioridade(topico.prioridade),
                          ),
                        ),
                        onTap: () {
                          // Editar tópico
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditarTopicoView(topico: topico),
                            ),
                          );
                        },
                        onLongPress: () {
                          // Excluir tópico
                          _confirmarExclusao(context, topicoVM, topico.id!);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Cores.primaria,
        child: Icon(Icons.add),
        onPressed: () {
          // Adicionar novo tópico
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarTopicoView()),
          );
        },
      ),
    );
  }

  // Obter a cor correspondente à prioridade
  Color _getCorPrioridade(String? prioridade) {
    switch (prioridade) {
      case 'Baixa':
        return Cores.prioridadeCor('Baixa');
      case 'Média':
        return Cores.prioridadeCor('Média');
      case 'Alta':
        return Cores.prioridadeCor('Alta');
      case 'Urgente':
        return Cores.prioridadeCor('Urgente');
      default:
        return Colors.black;
    }
  }

  // Confirmar exclusão de tópico
  void _confirmarExclusao(
      BuildContext context, TopicoViewModel topicoVM, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Excluir Tópico'),
        content: Text('Deseja realmente excluir este tópico?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              await topicoVM.excluirTopico(id);
              Navigator.of(context).pop();
            },
            child: Text('Excluir'),
          ),
        ],
      ),
    );
  }
}
