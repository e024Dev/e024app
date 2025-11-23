import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';

abstract class ProjetosRepository {
  Future<List<ProjetoModel>> findAll();
}