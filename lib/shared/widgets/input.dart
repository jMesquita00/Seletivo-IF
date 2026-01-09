import 'package:flutter/material.dart';
import 'package:seletivo_if/shared/colors/colors.dart';

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
        SizedBox(
          width: 300,
          height: 47,
          child: TextField(
            controller: nomeController, // usa o controller passado
            decoration: InputDecoration(
              labelText: label, // usa o label passado
              labelStyle: const TextStyle(color: AppColors.text),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.success, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
