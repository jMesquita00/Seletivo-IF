import 'package:flutter/material.dart';
import 'package:seletivo_if/shared/widgets/buton.dart';

class SimulatedResult extends StatelessWidget {
  final int acertos;
  final int erros;

  const SimulatedResult({super.key, this.acertos = 0, this.erros = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(49, 153, 69, 1),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Simulado IF",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Título Sublinhado
            const Text(
              "Resultado",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
                decorationThickness: 1.5,
              ),
            ),

            const SizedBox(height: 50),

            Icon(Icons.workspace_premium, size: 100, color: Colors.green[600]),

            const SizedBox(height: 60),

            // Linha de Acertos
            _buildStatRow(
              label: "Acertos",
              count: acertos,
              icon: Icons.check_circle,
              iconColor: const Color(0xFF00C853),
            ),

            const SizedBox(height: 20),

            // Linha de Erros
            _buildStatRow(
              label: "Erros",
              count: erros,
              icon: Icons.cancel,
              iconColor: Colors.red, // Vermelho
            ),

            const Spacer(),

            // Botão Finalizar
            MyButton(
              conteudo: ('Finalizar'),
              corFundo: Color(0xFF319945),
              corTexto: Colors.white,
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              fundo: true,
            ),

            const SizedBox(height: 100), // Espaço abaixo do botão
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow({
    required String label,
    required int count,
    required IconData icon,
    required Color iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Icon(icon, color: iconColor, size: 28),
              const SizedBox(width: 10),
              Text(
                "$count",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
