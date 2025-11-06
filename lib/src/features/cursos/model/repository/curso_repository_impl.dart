import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/repository/curso_repository.dart';

part 'curso_repository_impl.g.dart';

class CursoRepositoryImpl implements CursoRepository {

  final SupabaseClient supabase;

  CursoRepositoryImpl({required this.supabase});

  @override
  Future<List<CursoModel>> getCursos() async {
    final response = await supabase.from('cursos').select();
    return [for(final curso in response) CursoModel.fromJson(curso)];
  }
}

@riverpod
CursoRepositoryImpl cursoRepositoryImpl (Ref ref) {
  return CursoRepositoryImpl(supabase: ref.watch(supabaseProvider));
}