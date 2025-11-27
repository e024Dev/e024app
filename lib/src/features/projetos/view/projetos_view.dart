import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/features/projetos/viewmodel/projetos_viewmodel.dart';
import 'package:tcc_flutter_app/src/features/projetos/view/widgets/lista_projetos_widget.dart';

class ProjetosView extends ConsumerWidget {
  const ProjetosView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projetos = ref.watch(projetosProvider);
    print(projetos);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey.shade200,
        title: const Text('Projetos'),
      ),
      body: projetos.when(
        data: (data) => ListaProjetosWidget(projetos: data),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => const Center(child: Text('Erro ao carregar projetos.')),
      ),
    );
  }
}