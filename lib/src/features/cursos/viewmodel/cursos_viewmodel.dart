import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/repository/curso_repository_impl.dart';

part 'cursos_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class CursosViewModel extends _$CursosViewModel {
  @override
  FutureOr<List<CursoModel>> build() async {
    return ref.watch(cursoRepositoryImplProvider).getCursos();
  }
}