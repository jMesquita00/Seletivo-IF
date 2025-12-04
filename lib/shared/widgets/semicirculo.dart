import 'package:flutter/material.dart';

class TopSemiCircle extends StatelessWidget {
  final double radius;
  final Color color;

  const TopSemiCircle({super.key, required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius, // só metade aparece na tela
      child: CustomPaint(painter: _SemiCirclePainter(radius, color)),
    );
  }
}

class _SemiCirclePainter extends CustomPainter {
  final double radius;
  final Color color;

  _SemiCirclePainter(this.radius, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Desenha o círculo completo, mas só metade aparece no SizedBox
    canvas.drawCircle(
      Offset(radius / 2, -150), // centro
      // Offset(radius, radius), // centro
      radius, // raio
      paint,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
