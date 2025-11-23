
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/aluno_model.dart';

part 'aluno_projeto_model.g.dart';
part 'aluno_projeto_model.freezed.dart';

@freezed
abstract class AlunoProjetoModel with _$AlunoProjetoModel {
  const factory AlunoProjetoModel({
    required String papel,
    @JsonKey(name: 'alunos')
    required AlunoModel aluno,  
  }) = _AlunoProjetoModel;

  factory AlunoProjetoModel.fromJson(Map<String, dynamic> json) => _$AlunoProjetoModelFromJson(json);
}
