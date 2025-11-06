import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';

abstract class CursoRepository {
  Future<List<CursoModel>> getCursos();
}