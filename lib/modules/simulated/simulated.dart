import 'package:flutter/material.dart';
import 'package:seletivo_if/shared/widgets/buton.dart';

class Simulated extends StatelessWidget {
  const Simulated({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text(
            "Simulado IF",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     print("voltando para a telka anterior");
        //     // Navigator.pop(context);
        //   },
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        // ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: widthScreen,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Questão x de 40",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(2), // mais espaço interno
                      decoration: BoxDecoration(
                        color: Colors.amber, // cor de fundo
                        borderRadius: BorderRadius.circular(
                          5,
                        ), // cantos arredondados
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // sombra leve
                            blurRadius: 6,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.alarm, // ícone de relógio
                        size: 20, // tamanho maior
                        color: Colors.white, // cor do ícone
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "39:51",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.check_circle, color: Colors.green, size: 30),
                    SizedBox(width: 5),
                    Text("0"),
                    SizedBox(width: 5),
                    Icon(Icons.cancel, color: Colors.red, size: 30),
                    SizedBox(width: 5),
                    Text("0"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: widthScreen,
                height: 2,
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 336,
              child: Text(
                "Cada questão tem apenas uma alternativa correta, Cada questão tem apenas uma alternativa correta.",
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 50),
            MyButton(
              conteudo: "A) Ponto de parada",
              corFundo: Colors.green,
              corTexto: Colors.black,
              onPressed: () {
                print("Proxima questão");
              },
              fundo: false,
            ),
            SizedBox(height: 40),
            MyButton(
              conteudo: "A) Ponto de parada",
              corFundo: Colors.green,
              corTexto: Colors.black,
              onPressed: () {
                print("Proxima questão");
              },
              fundo: false,
            ),
            SizedBox(height: 40),
            MyButton(
              conteudo: "A) Ponto de parada",
              corFundo: Colors.green,
              corTexto: Colors.black,
              onPressed: () {
                print("Proxima questão");
              },
              fundo: false,
            ),
            SizedBox(height: 40),
            MyButton(
              conteudo: "A) Ponto de parada",
              corFundo: Colors.green,
              corTexto: Colors.black,
              onPressed: () {
                print("Proxima questão");
              },
              fundo: false,
            ),
          ],
        ),
      ),
    );
  }
}
