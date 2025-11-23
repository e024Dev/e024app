// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prestador_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrestadorModel {

@JsonKey(includeToJson: false) String get id; String get nome; String get endereco; double get latitude; double get longitude; double get distancia;
/// Create a copy of PrestadorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrestadorModelCopyWith<PrestadorModel> get copyWith => _$PrestadorModelCopyWithImpl<PrestadorModel>(this as PrestadorModel, _$identity);

  /// Serializes this PrestadorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrestadorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.endereco, endereco) || other.endereco == endereco)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distancia, distancia) || other.distancia == distancia));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,endereco,latitude,longitude,distancia);

@override
String toString() {
  return 'PrestadorModel(id: $id, nome: $nome, endereco: $endereco, latitude: $latitude, longitude: $longitude, distancia: $distancia)';
}


}

/// @nodoc
abstract mixin class $PrestadorModelCopyWith<$Res>  {
  factory $PrestadorModelCopyWith(PrestadorModel value, $Res Function(PrestadorModel) _then) = _$PrestadorModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, String nome, String endereco, double latitude, double longitude, double distancia
});




}
/// @nodoc
class _$PrestadorModelCopyWithImpl<$Res>
    implements $PrestadorModelCopyWith<$Res> {
  _$PrestadorModelCopyWithImpl(this._self, this._then);

  final PrestadorModel _self;
  final $Res Function(PrestadorModel) _then;

/// Create a copy of PrestadorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nome = null,Object? endereco = null,Object? latitude = null,Object? longitude = null,Object? distancia = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,endereco: null == endereco ? _self.endereco : endereco // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,distancia: null == distancia ? _self.distancia : distancia // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PrestadorModel].
extension PrestadorModelPatterns on PrestadorModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrestadorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrestadorModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrestadorModel value)  $default,){
final _that = this;
switch (_that) {
case _PrestadorModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrestadorModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrestadorModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  String nome,  String endereco,  double latitude,  double longitude,  double distancia)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrestadorModel() when $default != null:
return $default(_that.id,_that.nome,_that.endereco,_that.latitude,_that.longitude,_that.distancia);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  String nome,  String endereco,  double latitude,  double longitude,  double distancia)  $default,) {final _that = this;
switch (_that) {
case _PrestadorModel():
return $default(_that.id,_that.nome,_that.endereco,_that.latitude,_that.longitude,_that.distancia);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String id,  String nome,  String endereco,  double latitude,  double longitude,  double distancia)?  $default,) {final _that = this;
switch (_that) {
case _PrestadorModel() when $default != null:
return $default(_that.id,_that.nome,_that.endereco,_that.latitude,_that.longitude,_that.distancia);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrestadorModel implements PrestadorModel {
  const _PrestadorModel({@JsonKey(includeToJson: false) required this.id, required this.nome, required this.endereco, required this.latitude, required this.longitude, required this.distancia});
  factory _PrestadorModel.fromJson(Map<String, dynamic> json) => _$PrestadorModelFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override final  String nome;
@override final  String endereco;
@override final  double latitude;
@override final  double longitude;
@override final  double distancia;

/// Create a copy of PrestadorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrestadorModelCopyWith<_PrestadorModel> get copyWith => __$PrestadorModelCopyWithImpl<_PrestadorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrestadorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrestadorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.endereco, endereco) || other.endereco == endereco)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distancia, distancia) || other.distancia == distancia));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,endereco,latitude,longitude,distancia);

@override
String toString() {
  return 'PrestadorModel(id: $id, nome: $nome, endereco: $endereco, latitude: $latitude, longitude: $longitude, distancia: $distancia)';
}


}

/// @nodoc
abstract mixin class _$PrestadorModelCopyWith<$Res> implements $PrestadorModelCopyWith<$Res> {
  factory _$PrestadorModelCopyWith(_PrestadorModel value, $Res Function(_PrestadorModel) _then) = __$PrestadorModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, String nome, String endereco, double latitude, double longitude, double distancia
});




}
/// @nodoc
class __$PrestadorModelCopyWithImpl<$Res>
    implements _$PrestadorModelCopyWith<$Res> {
  __$PrestadorModelCopyWithImpl(this._self, this._then);

  final _PrestadorModel _self;
  final $Res Function(_PrestadorModel) _then;

/// Create a copy of PrestadorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nome = null,Object? endereco = null,Object? latitude = null,Object? longitude = null,Object? distancia = null,}) {
  return _then(_PrestadorModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,endereco: null == endereco ? _self.endereco : endereco // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,distancia: null == distancia ? _self.distancia : distancia // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
