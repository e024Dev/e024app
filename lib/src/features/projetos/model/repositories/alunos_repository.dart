import 'package:tcc_flutter_app/src/features/projetos/model/aluno_projeto_model.dart';

abstract class AlunosRepository {
  Future<List<AlunoProjetoModel>> findByProjetoId(int idProjeto);
}