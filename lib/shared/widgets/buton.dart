import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String conteudo;
  final VoidCallback onPressed;
  final Color corFundo;
  final Color corTexto;
  final bool fundo;

  const MyButton({
    super.key,
    required this.conteudo,
    required this.corFundo,
    required this.corTexto,
    required this.onPressed,
    required this.fundo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3), // sombra com opacidade
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(100),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: fundo ? corFundo : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            elevation: 0, // desliga sombra padrão do ElevatedButton
          ),
          child: Text(
            conteudo,
            style: TextStyle(
              color: corTexto,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
