import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/aluno_model.dart';

part 'prodeto_model.g.dart';
part 'prodeto_model.freezed.dart';

@freezed
abstract class ProjetoModel with _$ProjetoModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProjetoModel({
    @JsonKey(includeToJson: false)
    int? id,
    required String titulo,
    required String descricao,
    @JsonKey(name: 'link_externo')
    required String url,
    @JsonKey(name: 'imagem_capa')
    required String urlImagem,
    @JsonKey(name: 'cursos')
    required CursoModel curso,
  }) = _ProjetoModel;
  factory ProjetoModel.fromJson(Map<String, dynamic> json) => _$ProjetoModelFromJson(json);
}