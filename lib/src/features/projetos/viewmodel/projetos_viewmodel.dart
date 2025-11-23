import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/repositories/projetos_repository_impl.dart';

part 'projetos_viewmodel.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<ProjetoModel>> projetos(Ref ref) {
  return ref.watch(projetosRepositoryProvider).findAll();
}
