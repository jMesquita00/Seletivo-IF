import 'package:flutter/material.dart';
import 'package:seletivo_if/shared/widgets/semicirculo.dart';

class TopHeader extends StatelessWidget {
  final double widthScreen;

  const TopHeader({super.key, required this.widthScreen});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: TopSemiCircle(radius: widthScreen, color: Colors.green),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              "lib/shared/assets/logoIfwhite.png",
              height: 100,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Text(
              "Olá, usuário",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
        ),
      ],
    );
  }
}
