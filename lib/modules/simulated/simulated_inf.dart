import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/simulated/simulated.dart';
import 'package:seletivo_if/shared/widgets/buton.dart';

class SimulatedInf extends StatefulWidget {
  const SimulatedInf({super.key});

  @override
  State<SimulatedInf> createState() => _SimulatedInfState();
}

class _SimulatedInfState extends State<SimulatedInf>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "Simulado IF",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 60),
            const SizedBox(
              width: 300,
              child: Text(
                "Instruções",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 300,
              child: Text(
                "Leia as instruções para o simulado",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 30),
              child: Text(
                "O simulado contém 40 questões sorteadas aleatoriamente do banco de dados.",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Text(
                "Cada questão tem apenas uma alternativa correta.",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Text(
                "Tempo total para a prova: 40 minutos.",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: MyButton(
                conteudo: "Começar simulado",
                corFundo: Colors.green,
                corTexto: Colors.white,
                fundo: true,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const Simulated(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

