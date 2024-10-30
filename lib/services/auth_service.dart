import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login com email e senha
  Future<User?> login(String email, String senha) async {
    try {
      print('Login com email e senha. Email: $email, Senha: $senha');
      print('teste');
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      print('teste2');
      print('Usuário logado: ${cred.user}');
      return cred.user;
    } catch (e) {
      print('Erro no login: $e');
      return null;
    }
  }

  // Usuário atual
  User? get usuarioAtual => _auth.currentUser;
}
