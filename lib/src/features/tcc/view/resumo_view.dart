import 'package:flutter/material.dart';

class ResumoView extends StatelessWidget {
  const ResumoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsividade')),
      body: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: SizedBox(
          width: 50,
          height: 50,
          child: Container(color: Colors.blue),
        ),
      ),
    );
  }
}
