import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/auth/create_account_page.dart';
import 'package:seletivo_if/modules/home/main_screen.dart';
import 'package:seletivo_if/shared/colors/colors.dart';
import 'package:seletivo_if/shared/widgets/buton.dart';
import 'package:seletivo_if/shared/widgets/input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 50),

              // ---------- LOGO ----------
              Image.asset(
                'lib/shared/assets/LogoIF.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 24),

              // -------- TÍTULO --------
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

              MyInput(nomeController: TextEditingController(), label: 'E-mail'),

              const SizedBox(height: 16),

              MyInput(nomeController: TextEditingController(), label: 'Senha'),

              const SizedBox(height: 24),

              MyButton(
                conteudo: 'Login',
                corFundo: AppColors.primary,
                corTexto: AppColors.background,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
                fundo: true,
              ),
              const SizedBox(height: 12),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "Esqueceu a senha ?",
                  style: TextStyle(color: AppColors.secondary),
                ),
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Ainda não tem conta? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreatAccountPage(),
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

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
