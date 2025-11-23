// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prestador_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrestadorModel _$PrestadorModelFromJson(Map<String, dynamic> json) =>
    _PrestadorModel(
      id: json['id'] as String,
      nome: json['nome'] as String,
      endereco: json['endereco'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      distancia: (json['distancia'] as num).toDouble(),
    );

Map<String, dynamic> _$PrestadorModelToJson(_PrestadorModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'endereco': instance.endereco,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distancia': instance.distancia,
    };
