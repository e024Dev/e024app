// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curso_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CursoModel {

@JsonKey(name: 'id', includeToJson: false) int? get id; String? get nome; String? get descricao; String? get ementaResumida; String? get urlImagem;
/// Create a copy of CursoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursoModelCopyWith<CursoModel> get copyWith => _$CursoModelCopyWithImpl<CursoModel>(this as CursoModel, _$identity);

  /// Serializes this CursoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CursoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.ementaResumida, ementaResumida) || other.ementaResumida == ementaResumida)&&(identical(other.urlImagem, urlImagem) || other.urlImagem == urlImagem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,descricao,ementaResumida,urlImagem);

@override
String toString() {
  return 'CursoModel(id: $id, nome: $nome, descricao: $descricao, ementaResumida: $ementaResumida, urlImagem: $urlImagem)';
}


}

/// @nodoc
abstract mixin class $CursoModelCopyWith<$Res>  {
  factory $CursoModelCopyWith(CursoModel value, $Res Function(CursoModel) _then) = _$CursoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', includeToJson: false) int? id, String? nome, String? descricao, String? ementaResumida, String? urlImagem
});




}
/// @nodoc
class _$CursoModelCopyWithImpl<$Res>
    implements $CursoModelCopyWith<$Res> {
  _$CursoModelCopyWithImpl(this._self, this._then);

  final CursoModel _self;
  final $Res Function(CursoModel) _then;

/// Create a copy of CursoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nome = freezed,Object? descricao = freezed,Object? ementaResumida = freezed,Object? urlImagem = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nome: freezed == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String?,descricao: freezed == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String?,ementaResumida: freezed == ementaResumida ? _self.ementaResumida : ementaResumida // ignore: cast_nullable_to_non_nullable
as String?,urlImagem: freezed == urlImagem ? _self.urlImagem : urlImagem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CursoModel].
extension CursoModelPatterns on CursoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CursoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CursoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CursoModel value)  $default,){
final _that = this;
switch (_that) {
case _CursoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CursoModel value)?  $default,){
final _that = this;
switch (_that) {
case _CursoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', includeToJson: false)  int? id,  String? nome,  String? descricao,  String? ementaResumida,  String? urlImagem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CursoModel() when $default != null:
return $default(_that.id,_that.nome,_that.descricao,_that.ementaResumida,_that.urlImagem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', includeToJson: false)  int? id,  String? nome,  String? descricao,  String? ementaResumida,  String? urlImagem)  $default,) {final _that = this;
switch (_that) {
case _CursoModel():
return $default(_that.id,_that.nome,_that.descricao,_that.ementaResumida,_that.urlImagem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', includeToJson: false)  int? id,  String? nome,  String? descricao,  String? ementaResumida,  String? urlImagem)?  $default,) {final _that = this;
switch (_that) {
case _CursoModel() when $default != null:
return $default(_that.id,_that.nome,_that.descricao,_that.ementaResumida,_that.urlImagem);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _CursoModel implements CursoModel {
  const _CursoModel({@JsonKey(name: 'id', includeToJson: false) this.id, this.nome, this.descricao, this.ementaResumida, this.urlImagem});
  factory _CursoModel.fromJson(Map<String, dynamic> json) => _$CursoModelFromJson(json);

@override@JsonKey(name: 'id', includeToJson: false) final  int? id;
@override final  String? nome;
@override final  String? descricao;
@override final  String? ementaResumida;
@override final  String? urlImagem;

/// Create a copy of CursoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursoModelCopyWith<_CursoModel> get copyWith => __$CursoModelCopyWithImpl<_CursoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CursoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CursoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.ementaResumida, ementaResumida) || other.ementaResumida == ementaResumida)&&(identical(other.urlImagem, urlImagem) || other.urlImagem == urlImagem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,descricao,ementaResumida,urlImagem);

@override
String toString() {
  return 'CursoModel(id: $id, nome: $nome, descricao: $descricao, ementaResumida: $ementaResumida, urlImagem: $urlImagem)';
}


}

/// @nodoc
abstract mixin class _$CursoModelCopyWith<$Res> implements $CursoModelCopyWith<$Res> {
  factory _$CursoModelCopyWith(_CursoModel value, $Res Function(_CursoModel) _then) = __$CursoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', includeToJson: false) int? id, String? nome, String? descricao, String? ementaResumida, String? urlImagem
});




}
/// @nodoc
class __$CursoModelCopyWithImpl<$Res>
    implements _$CursoModelCopyWith<$Res> {
  __$CursoModelCopyWithImpl(this._self, this._then);

  final _CursoModel _self;
  final $Res Function(_CursoModel) _then;

/// Create a copy of CursoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nome = freezed,Object? descricao = freezed,Object? ementaResumida = freezed,Object? urlImagem = freezed,}) {
  return _then(_CursoModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nome: freezed == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String?,descricao: freezed == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String?,ementaResumida: freezed == ementaResumida ? _self.ementaResumida : ementaResumida // ignore: cast_nullable_to_non_nullable
as String?,urlImagem: freezed == urlImagem ? _self.urlImagem : urlImagem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
