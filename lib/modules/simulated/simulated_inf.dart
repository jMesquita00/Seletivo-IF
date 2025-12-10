import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/simulated/simulated.dart';
import 'package:seletivo_if/shared/widgets/buton.dart';

class SimulatedInf extends StatelessWidget {
  const SimulatedInf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text(
            "Simulado IF",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            // print("voltando para a telka anterior");
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "Instruções",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: Padding(
                padding: EdgeInsetsGeometry.only(top: 0),
                child: const Text(
                  "Leia as instruções para o simulado",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 20, bottom: 10, left: 30),
              child: const Text(
                "O simuldado contém 40 questoes  sorteadas aleatoriamente do banco de dados.rtt",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 20, left: 30, right: 30),
              child: const Text(
                "Cada questão tem apenas uma alternativa correta.",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 20, left: 30, right: 30),
              child: const Text(
                "Escolha apenas uma alternativa para cada questão.",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 20, left: 30, right: 30),
              child: const Text(
                "Tempo total para a prova: 40 minutos.",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 20, left: 30, right: 30),
              child: const Text(
                "Parar ser aprovado, você precisa acertar pelo menos 21 questões (71%).",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 20, left: 30, right: 30),
              child: const Text(
                "Este simulado não substitui a prova do IFMA.",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: MyButton(
                conteudo: "Começar simulado",
                corFundo: Colors.green,
                corTexto: Colors.white,
                onPressed: () {
                  // print("começando o simulado");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Simulated()),
                  );
                },
                fundo: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
