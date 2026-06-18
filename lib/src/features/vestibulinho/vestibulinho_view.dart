import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
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
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyJM_JeVrhRCXONOdo4yDz_jLkkUK13JY_wbLmxtoVeA&s=10',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.school,
                          size: 48,
                          color: Theme.of(context).colorScheme.onSurfaceVariant),
                      const SizedBox(height: 8),
                      Text('Vestibulinho',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
              ),
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
        onPressed: () async {
          final uri = Uri.parse('https://vestibulinho.etec.sp.gov.br/home/');
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        label: const Text('INSCREVA-SE'),
        icon: const Icon(Icons.link),
      ),
    );
  }
}
