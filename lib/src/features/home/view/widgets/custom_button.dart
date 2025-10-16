import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.altura,
    required this.largura,
    required this.texto,
    required this.cor,
  });
  final double altura;
  final double largura;
  final String texto;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: SizedBox(
        height: altura,
        width: largura,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(cor),
          ),
          onPressed: () {},
          child: Text(texto),
        ),
      ),
    );
  }
}
