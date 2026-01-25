import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/vestibulinho/model/curso_vestibulinho_repository_impl.dart';

part 'curso_vestibulinho_viewmodel.g.dart';

@riverpod
FutureOr<List<CursoModel>> cursosVestibulinho(Ref ref) async {
  return await ref.read(cursoVestibulinhoRepositoryProvider).findAll();
}