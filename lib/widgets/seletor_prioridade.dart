// lib/widgets/seletor_prioridade.dart
import 'package:flutter/material.dart';
import '../utils/constantes.dart';
import '../utils/cores.dart';

class SeletorPrioridade extends StatelessWidget {
  final String prioridadeSelecionada;
  final ValueChanged<String?> onChanged;

  const SeletorPrioridade({
    Key? key,
    required this.prioridadeSelecionada,
    required this.onChanged,
  }) : super(key: key);

  Color _getCorPrioridade(String prioridade) {
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
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: prioridadeSelecionada,
      items: Constantes.listaPrioridades.map((String prioridade) {
        return DropdownMenuItem<String>(
          value: prioridade,
          child: Text(
            prioridade,
            style: TextStyle(color: _getCorPrioridade(prioridade)),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Prioridade',
        border: OutlineInputBorder(),
      ),
    );
  }
}
