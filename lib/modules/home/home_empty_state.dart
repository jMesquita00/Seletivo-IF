import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/lesson/lesson_list_screen.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // HEADER VERDE
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            height: 260,
            width: double.infinity,
            color: const Color(0xff319945),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/shared/assets/logoIfwhite.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const Text(
                  'Olá, Usuário',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 100),

        const Text(
          "Meus estudos",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_circle_outline, size: 20),
            SizedBox(width: 6),
            Text("Ainda sem estudos", style: TextStyle(color: Colors.grey)),
          ],
        ),

        const SizedBox(height: 40),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "Pronto pra dar o primeiro passo rumo ao IF?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 80);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20,
      size.width,
      size.height - 80,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
