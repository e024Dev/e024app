import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/features/vestibulinho/viewmodel/curso_vestibulinho_viewmodel.dart';
import 'package:tcc_flutter_app/src/features/vestibulinho/widgets/curso_vestibulinho_widget.dart';

class VestibulinhoView extends ConsumerWidget {
  const VestibulinhoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cursosVestibulinho = ref.watch(cursosVestibulinhoProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Vestibulinho')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://bkpsitecpsnew.blob.core.windows.net/uploadsitecps/sites/48/2025/08/1.png',
              // cacheHeight: 200,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                int total = loadingProgress.expectedTotalBytes ?? 0;
                int loaded = loadingProgress.cumulativeBytesLoaded;
                return Center(
                  child: LinearProgressIndicator(
                    value: total != 0 ? loaded / total : null,
                  ),
                );
              },
            ),
            cursosVestibulinho.when(
              data: (cursos) => Column(
                children: List.generate(
                  cursos.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: CursoVestibulinhoWidget(curso: cursos[index]),
                  ),
                ),
              ),
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),
              loading: () => Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('INSCREVA-SE'),
        icon: const Icon(Icons.link),
      ),
    );
  }
}
