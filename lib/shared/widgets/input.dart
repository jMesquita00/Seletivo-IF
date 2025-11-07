import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final TextEditingController nomeController;
  final String label;

  const MyInput({
    super.key,
    required this.nomeController, // agora o controller vem do construtor
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nomeController, // usa o controller passado
          decoration: InputDecoration(
            labelText: label, // usa o label passado
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}