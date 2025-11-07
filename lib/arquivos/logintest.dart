import 'package:flutter/material.dart';
import 'package:seletivo_if/shared/widgets/button.dart';
import 'package:seletivo_if/shared/widgets/card_disciplin.dart';
import 'package:seletivo_if/shared/widgets/input.dart';

class LoginPage1 extends StatelessWidget {
  LoginPage1({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              // LOGO
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset('assets/LogoIF.png', width: 140),
              ),

              // FRASE
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Bem-vindo de volta!",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // INPUT EMAIL
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyInput(

                  label: 'E-mail',
                  nomeController: emailController,
                ),
              ),

              const SizedBox(height: 30),

              // INPUT SENHA
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyInput(
                  label: 'Senha',
                  nomeController: senhaController,
                ),
              ),

              const SizedBox(height: 20),

              // BOTÃO LOGIN
              MyButton(
                conteudo: ("Entrar"),
                corFundo: Colors.green,
                corTexto: Colors.white,
                onPressed: () {
                  print("Login pressionado");
                },
              ),

              const SizedBox(height: 20),

              // ESQUECEU SENHA
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Esqueceu a senha?",
                  style: TextStyle(color: Colors.black54),
                ),
              ),

              // CRIAR CONTA
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Ainda não tem conta? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}