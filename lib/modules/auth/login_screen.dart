import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/auth/create_account_page.dart';
import 'package:seletivo_if/modules/home/main_screen.dart';
import 'package:seletivo_if/modules/auth/auth_service.dart';
import 'package:seletivo_if/shared/colors/colors.dart';
import 'package:seletivo_if/shared/widgets/buton.dart';
import 'package:seletivo_if/shared/widgets/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  final AuthService _authService = AuthService();

  String? errorMessage;

  Future<void> fazerLogin() async {
    try {
      await _authService.login(
        email: emailController.text.trim(),
        senha: senhaController.text.trim(),
      );

      // Login deu certo → entra na Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    } catch (e) {
      setState(() {
        errorMessage = 'Email ou senha inválidos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 50),

              Image.asset(
                'lib/shared/assets/LogoIF.png',
                width: 200,
                height: 200,
              ),

              const SizedBox(height: 24),

              const Text(
                "Chegou a hora de começar sua\njornada pro IF!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                "Entre para continuar",
                style: TextStyle(fontSize: 14, color: AppColors.text),
              ),

              const SizedBox(height: 16),

              MyInput(
                nomeController: emailController,
                label: 'E-mail',
              ),

              const SizedBox(height: 16),

              MyInput(
                nomeController: senhaController,
                label: 'Senha',
              ),

              const SizedBox(height: 12),

              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),

              const SizedBox(height: 12),

              MyButton(
                conteudo: 'Login',
                corFundo: AppColors.primary,
                corTexto: AppColors.background,
                fundo: true,
                onPressed: fazerLogin,
              ),

              const SizedBox(height: 12),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "Esqueceu a senha ?",
                  style: TextStyle(color: AppColors.secondary),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Ainda não tem conta? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CreatAccountPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "criar conta",
                      style: TextStyle(
                        color: AppColors.secondary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
