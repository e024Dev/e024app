
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prestador_model.g.dart';
part 'prestador_model.freezed.dart';

@freezed
abstract class PrestadorModel with _$PrestadorModel {
  const factory PrestadorModel({
    @JsonKey(includeToJson: false)
    required String id,
    required String nome,
    required String endereco,
    required double latitude,
    required double longitude,
    required double distancia
  }) = _PrestadorModel;

  factory PrestadorModel.fromJson(Map<String, dynamic> json) => _$PrestadorModelFromJson(json);
}