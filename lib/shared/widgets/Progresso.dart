import 'package:flutter/material.dart';
import 'package:seletivo_if/shared/colors/colors.dart';

class BarraProgresso extends StatelessWidget {
  final double progresso; // valor entre 0.0 e 1.0

  const BarraProgresso({super.key, required this.progresso});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Barra de progresso
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progresso,
            minHeight: 30,
            backgroundColor: Colors.grey[300],
            color: AppColors.success,
          ),
        ),

        // Texto da porcentagem
        Text(
          "${(progresso * 100).toInt()}%",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
