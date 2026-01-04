import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/auth/login_screen.dart';
import 'package:seletivo_if/shared/widgets/buton.dart';
import 'package:seletivo_if/shared/widgets/input.dart';

class CreatAccountPage extends StatefulWidget {
  const CreatAccountPage({super.key});

  @override
  State<CreatAccountPage> createState() => _CreatAccountPageState();
}

class _CreatAccountPageState extends State<CreatAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text(''), centerTitle: true),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 55, bottom: 20),
              child: Image.asset("lib/shared/assets/LogoIF.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),

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
                nomeController: TextEditingController(),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyInput(
                label: 'E-mail',
                nomeController: TextEditingController(),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyInput(
                label: 'Password',
                nomeController: TextEditingController(),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyInput(
                label: 'Confirm Password',
                nomeController: TextEditingController(),
              ),
            ),
            SizedBox(height: 30),

            MyButton(
              conteudo: ("Criar conta"),
              corFundo: Colors.green,
              corTexto: Colors.white,
              fundo: true,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            SizedBox(height: 20),
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
                        MaterialPageRoute(builder: (context) => LoginPage()),
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
