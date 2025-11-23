import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';
import 'package:go_router/go_router.dart';

class ProjetoWidget extends ConsumerWidget {
  const ProjetoWidget({super.key, required this.projeto});

  final ProjetoModel projeto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card.filled(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
              projeto.urlImagem,
              fit: BoxFit.cover,
              cacheHeight: 200,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                final total = loadingProgress.expectedTotalBytes;
                final loaded = loadingProgress.cumulativeBytesLoaded;

                return Center(
                  child: CircularProgressIndicator(
                    value: total != null ? loaded / total : null,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              projeto.titulo,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Text(
              projeto.descricao,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Chip(label: Text(projeto.curso.nome!)),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16),
              child: FilledButton(
                onPressed: () {
                  context.go('/projeto', extra: projeto);
                },
                child: const Text('Ver projeto'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
