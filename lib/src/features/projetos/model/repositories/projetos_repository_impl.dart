import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/repositories/projetos_repository.dart';

part 'projetos_repository_impl.g.dart';

class ProjetosRepositoryImpl implements ProjetosRepository {
  final SupabaseClient supabase;

  ProjetosRepositoryImpl({required this.supabase});

  @override
  Future<List<ProjetoModel>> findAll() async {
    final projetos = await supabase.from('projetos')
    .select('''
      *,
      cursos(*),
      alunos_projetos(papel,alunos(*))
      ''');
    return [for (final projeto in projetos) ProjetoModel.fromJson(projeto)];
  }
}

@riverpod
ProjetosRepository projetosRepository(Ref ref) {
  return ProjetosRepositoryImpl(supabase: ref.watch(supabaseProvider));
}
