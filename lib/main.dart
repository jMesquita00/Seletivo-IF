import 'package:flutter/material.dart';
import 'package:seletivo_if/shared/widgets/buton.dart';
// import 'package:seletivo_if/modules/auth/login_page.dart';
// import 'package:seletivo_if/shared/widgets/card_disciplin.dart';
import 'package:seletivo_if/shared/widgets/input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Inicial',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset("lib/shared/assets/LogoIF.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),

              child: Text(
                "Quem se prepara chega lá",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // CardDisciplina(
            //   color: Colors.black,
            //   icon:Icons.ac_unit_sharp,
            //    name: 'matematica',)  
            // My_Input(conteudo: 'E-mail', icone: Icons.email)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyInput(
                label: 'Name',
                nomeController: TextEditingController(),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
              onPressed: () {
                print("enviando");
              },
            ),
          ],
        ),
      ),
    );
  }
}
