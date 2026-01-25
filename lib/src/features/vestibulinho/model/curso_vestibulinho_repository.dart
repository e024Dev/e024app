import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';

abstract interface class CursoVestibulinhoRepository {
  Future<List<CursoModel>> findAll();
}