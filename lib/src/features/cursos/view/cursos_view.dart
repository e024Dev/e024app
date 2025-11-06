import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/features/cursos/view/widgets/lista_cursos_widget.dart';
import 'package:tcc_flutter_app/src/features/cursos/viewmodel/cursos_viewmodel.dart';

class CursosView extends ConsumerWidget {
  const CursosView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cursos = ref.watch(cursosViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Cursos')),
      body: cursos.when(
        data: (cursos) {
          return ListaCursosWidget(cursos: cursos);
        },
        error: (error, stackTrace) =>
            const Center(child: Text('Erro ao carregar cursos')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
