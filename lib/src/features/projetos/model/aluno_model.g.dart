// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlunoModel _$AlunoModelFromJson(Map<String, dynamic> json) => _AlunoModel(
  id: (json['id'] as num?)?.toInt(),
  nome: json['nome'] as String,
  email: json['email'] as String,
  fotoPerfil: json['foto_perfil'] as String,
);

Map<String, dynamic> _$AlunoModelToJson(_AlunoModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'email': instance.email,
      'foto_perfil': instance.fotoPerfil,
    };
