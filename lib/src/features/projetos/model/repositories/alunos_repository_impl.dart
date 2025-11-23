import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/aluno_projeto_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/repositories/alunos_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'alunos_repository_impl.g.dart';

class AlunosRepositoryImpl implements AlunosRepository {
  final SupabaseClient supabase;

  AlunosRepositoryImpl({required this.supabase});

  @override
  Future<List<AlunoProjetoModel>> findByProjetoId(int idProjeto) async {
    final rows = await supabase
        .from('alunos_projetos')
        .select('''
      papel,
      alunos!inner(id, nome, email, foto_perfil)  
      ''')
        .eq('id_projeto', idProjeto);

    return [for (final row in rows) AlunoProjetoModel.fromJson(row)];
  }
}

@riverpod
AlunosRepository alunosRepository(Ref ref) {
  return AlunosRepositoryImpl(supabase: ref.watch(supabaseProvider));
}
