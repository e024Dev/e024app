// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno_projeto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlunoProjetoModel _$AlunoProjetoModelFromJson(Map<String, dynamic> json) =>
    _AlunoProjetoModel(
      papel: json['papel'] as String,
      aluno: AlunoModel.fromJson(json['alunos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlunoProjetoModelToJson(_AlunoProjetoModel instance) =>
    <String, dynamic>{'papel': instance.papel, 'alunos': instance.aluno};
