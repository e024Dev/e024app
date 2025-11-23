import 'package:flutter/material.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/view/widgets/projeto_widget.dart';

class ListaProjetosWidget extends StatelessWidget {
  const ListaProjetosWidget({super.key, required this.projetos});

  final List<ProjetoModel> projetos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projetos.length,
      itemBuilder: (context, index) {
        final projeto = projetos[index];
        return ProjetoWidget(projeto: projeto);
      },
    );
  }
}