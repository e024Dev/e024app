import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';

class ListaCursosWidget extends StatelessWidget {
  const ListaCursosWidget({super.key, required this.cursos});

  final List<CursoModel> cursos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cursos.length,
      itemBuilder: (context, index) {
        final curso = cursos[index];
        return ListTile(
          leading: CircleAvatar(child: Text(curso.nome!.substring(0, 1))),
          title: Text(curso.nome!),
          subtitle: Text(curso.descricao!),
          onTap: () => context.go('/cursos/curso', extra: curso),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
