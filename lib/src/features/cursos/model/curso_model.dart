import 'package:freezed_annotation/freezed_annotation.dart';

part 'curso_model.freezed.dart';
part 'curso_model.g.dart';

@freezed
abstract class CursoModel with _$CursoModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CursoModel({
    @JsonKey(name: 'id', includeToJson: false) int? id,
    String? nome,
    String? descricao,
    String? ementaResumida,
    String? urlImagem,
  }) = _CursoModel;

  factory CursoModel.fromJson(Map<String, dynamic> json) =>
      _$CursoModelFromJson(json);
}
