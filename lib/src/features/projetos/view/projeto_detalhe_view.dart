import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/aluno_projeto_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/repositories/alunos_repository_impl.dart';

class ProjetoDetalheView extends ConsumerWidget {
  const ProjetoDetalheView({super.key, required this.projeto});

  final ProjetoModel projeto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alunosRepo = ref.watch(alunosRepositoryProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                projeto.urlImagem,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Icon(Icons.broken_image,
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  final total = loadingProgress.expectedTotalBytes;
                  final loaded = loadingProgress.cumulativeBytesLoaded;
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: LinearProgressIndicator(
                      value: total != null ? loaded / total : null,
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    label: Text(projeto.curso.nome ?? 'Curso'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    projeto.titulo,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    projeto.descricao,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Alunos participantes',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          FutureBuilder<List<AlunoProjetoModel>>(
            future: alunosRepo.findByProjetoId(projeto.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(child: Text('Erro ao carregar alunos')),
                );
              }
              final alunos = snapshot.data ?? [];
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final alunoProjeto = alunos[index];
                    final aluno = alunoProjeto.aluno;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: aluno.fotoPerfil.isNotEmpty
                            ? NetworkImage(aluno.fotoPerfil)
                            : null,
                        child: aluno.fotoPerfil.isEmpty
                            ? Text(aluno.nome.isNotEmpty
                                ? aluno.nome[0].toUpperCase()
                                : '?')
                            : null,
                      ),
                      title: Text(aluno.nome),
                      subtitle: Text(alunoProjeto.papel.isNotEmpty
                          ? alunoProjeto.papel
                          : 'Participante'),
                    );
                  },
                  childCount: alunos.length,
                ),
              );
            },
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: FilledButton.icon(
                  onPressed: () async {
                    final uri = Uri.parse(projeto.url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Ver projeto completo'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
