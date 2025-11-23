import 'package:freezed_annotation/freezed_annotation.dart';

part 'aluno_model.g.dart';
part 'aluno_model.freezed.dart';

@freezed
abstract class AlunoModel with _$AlunoModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AlunoModel({
    @JsonKey(includeToJson: false) int? id,
    required String nome,
    required String email,
    required String fotoPerfil,
  }) = _AlunoModel;

  factory AlunoModel.fromJson(Map<String, dynamic> json) => _$AlunoModelFromJson(json);
}