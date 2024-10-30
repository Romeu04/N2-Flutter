// lib/views/login_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_viewmodel.dart';
import '../widgets/campo_texto_personalizado.dart';
import '../widgets/botao_personalizado.dart';
import '../utils/cores.dart';
import 'lista_topicos_view.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginVM = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Cores.primaria,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CampoTextoPersonalizado(
              hintText: 'Email',
              controller: _emailController,
            ),
            SizedBox(height: 16),
            CampoTextoPersonalizado(
              hintText: 'Senha',
              controller: _senhaController,
              obscureText: true,
            ),
            SizedBox(height: 16),
            loginVM.carregando
                ? CircularProgressIndicator()
                : BotaoPersonalizado(
                    texto: 'Entrar',
                    onPressed: () async {
                      String email = _emailController.text.trim();
                      String senha = _senhaController.text.trim();

                      bool sucesso = await loginVM.login(email, senha);
                      if (sucesso) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListaTopicosView(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(loginVM.erro ?? 'Erro no login')),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
