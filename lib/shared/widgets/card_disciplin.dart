import 'package:flutter/material.dart';
import 'package:seletivo_if/shared/widgets/Progresso.dart';

class CardDisciplina extends StatefulWidget {
  final String name;
  final String text;
  final Color color;

  const CardDisciplina({
    super.key,
    required this.name,
    required this.color,
    required this.text,
  });

  @override
  State<CardDisciplina> createState() => _CardDisciplinaState();
}

class _CardDisciplinaState extends State<CardDisciplina> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // ignore: deprecated_member_use
      color: widget.color.withOpacity(0.8), // fundo suave

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 130,
          child: Column(
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.directional(bottom: 20),
                child: Text(
                  widget.text,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              BarraProgresso(progresso: 0.25),
            ],
          ),
        ),
      ),
    );
  }
}
