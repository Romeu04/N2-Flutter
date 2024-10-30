// lib/utils/cores.dart
import 'package:flutter/material.dart';

class Cores {
  static const Color primaria = Colors.blue;

  static Color prioridadeCor(String prioridade) {
    switch (prioridade) {
      case 'Baixa':
        return Color(0xFFA5D6A7); // Verde Claro
      case 'Média':
        return Color(0xFFFFEB3B); // Amarelo
      case 'Alta':
        return Color(0xFFEF5350); // Vermelho
      case 'Urgente':
        return Color(0xFF000000); // Preto
      default:
        return Colors.grey;
    }
  }
}
