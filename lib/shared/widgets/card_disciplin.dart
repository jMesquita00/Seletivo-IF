import 'package:flutter/material.dart';

class CardDisciplina extends StatefulWidget {
  final String name;
  final IconData icon;
  final Color color;

  const CardDisciplina({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  State<CardDisciplina> createState() => _CardDisciplinaState();
}

class _CardDisciplinaState extends State<CardDisciplina> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // ignore: deprecated_member_use
      color: widget.color.withOpacity(0.2), // fundo suave

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(12),

      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: widget.color,
              child: Icon(
                widget.icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: widget.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}