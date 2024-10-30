// lib/widgets/campo_texto_personalizado.dart
import 'package:flutter/material.dart';

class CampoTextoPersonalizado extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const CampoTextoPersonalizado({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
