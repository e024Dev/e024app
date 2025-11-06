// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CursoModel _$CursoModelFromJson(Map<String, dynamic> json) => _CursoModel(
  id: (json['id'] as num?)?.toInt(),
  nome: json['nome'] as String?,
  descricao: json['descricao'] as String?,
  ementaResumida: json['ementa_resumida'] as String?,
  urlImagem: json['url_imagem'] as String?,
);

Map<String, dynamic> _$CursoModelToJson(_CursoModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'descricao': instance.descricao,
      'ementa_resumida': instance.ementaResumida,
      'url_imagem': instance.urlImagem,
    };
