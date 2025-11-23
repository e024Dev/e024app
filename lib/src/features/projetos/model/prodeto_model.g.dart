// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prodeto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjetoModel _$ProjetoModelFromJson(Map<String, dynamic> json) =>
    _ProjetoModel(
      id: (json['id'] as num?)?.toInt(),
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      url: json['link_externo'] as String,
      urlImagem: json['imagem_capa'] as String,
      curso: CursoModel.fromJson(json['cursos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjetoModelToJson(_ProjetoModel instance) =>
    <String, dynamic>{
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'link_externo': instance.url,
      'imagem_capa': instance.urlImagem,
      'cursos': instance.curso,
    };
