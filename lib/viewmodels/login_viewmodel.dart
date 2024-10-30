import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _carregando = false;
  String? _erro;

  bool get carregando => _carregando;
  String? get erro => _erro;

  Future<bool> login(String email, String senha) async {
    _carregando = true;
    notifyListeners();

    final usuario = await _authService.login(email, senha);

    _carregando = false;
    if (usuario == null) {
      print('Erro no login');
      _erro = null;
      notifyListeners();
      return true;
    } else {
      _erro = 'Email ou senha inválidos.';
      notifyListeners();
      return false;
    }
  }
}
