import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/vestibulinho/model/curso_vestibulinho_repository.dart';

part 'curso_vestibulinho_repository_impl.g.dart';

class CursoVestibulinhoRepositoryImpl implements CursoVestibulinhoRepository {
  final SupabaseClient supabase;

  CursoVestibulinhoRepositoryImpl({required this.supabase});

  @override
  Future<List<CursoModel>> findAll() async {
    var response = await supabase.from('cursos').select('*').eq('vestibulinho', true);
    return [for (final curso in response) CursoModel.fromJson(curso)];
  }
}

@riverpod
CursoVestibulinhoRepository cursoVestibulinhoRepository(Ref ref) {
  return CursoVestibulinhoRepositoryImpl(supabase: ref.watch(supabaseProvider));
}
