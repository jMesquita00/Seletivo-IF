import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/auth/login_screen.dart';
import 'package:seletivo_if/modules/auth/auth_service.dart';
import 'package:seletivo_if/shared/widgets/buton.dart';
import 'package:seletivo_if/shared/widgets/input.dart';

class CreatAccountPage extends StatefulWidget {
  const CreatAccountPage({super.key});

  @override
  State<CreatAccountPage> createState() => _CreatAccountPageState();
}

class _CreatAccountPageState extends State<CreatAccountPage> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

  final AuthService _authService = AuthService();

  String? errorMessage;

  Future<void> criarConta() async {
    if (senhaController.text != confirmarSenhaController.text) {
      setState(() {
        errorMessage = 'As senhas não coincidem';
      });
      return;
    }

    try {
      await _authService.criarConta(
        email: emailController.text.trim(),
        senha: senhaController.text.trim(),
      );

      // Conta criada com sucesso → volta para Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    } catch (e) {
      setState(() {
        errorMessage = 'Erro ao criar conta';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 55, bottom: 20),
              child: Image.asset("lib/shared/assets/LogoIF.png"),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Quem se prepara chega lá",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyInput(
                label: 'Name',
                nomeController: nomeController,
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyInput(
                label: 'E-mail',
                nomeController: emailController,
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyInput(
                label: 'Password',
                nomeController: senhaController,
                //obscureText: true,
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyInput(
                label: 'Confirm Password',
                nomeController: confirmarSenhaController,
                //obscureText: true,
              ),
            ),

            const SizedBox(height: 20),

            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 20),

            MyButton(
              conteudo: ("Criar conta"),
              corFundo: Colors.green,
              corTexto: Colors.white,
              fundo: true,
              onPressed: criarConta,
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Já tem uma conta? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    },
                    child: const Text(
                      "Entra agora ",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
