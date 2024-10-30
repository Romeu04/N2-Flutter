// lib/widgets/botao_personalizado.dart
import 'package:flutter/material.dart';
import '../utils/cores.dart';

class BotaoPersonalizado extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color? cor;

  const BotaoPersonalizado({
    Key? key,
    required this.texto,
    required this.onPressed,
    this.cor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: cor ?? Cores.primaria,
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(
        texto,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
