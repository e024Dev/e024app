import 'package:flutter/material.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';

class DetalheCursoView extends StatelessWidget {
  const DetalheCursoView({super.key, required this.curso});

  final CursoModel curso;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(curso.nome!)),
      body: Center(
        child: Text(curso.descricao!),
      ),
    );
  }
}
