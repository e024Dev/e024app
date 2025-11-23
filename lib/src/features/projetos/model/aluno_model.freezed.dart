// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aluno_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlunoModel {

@JsonKey(includeToJson: false) int? get id; String get nome; String get email; String get fotoPerfil;
/// Create a copy of AlunoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlunoModelCopyWith<AlunoModel> get copyWith => _$AlunoModelCopyWithImpl<AlunoModel>(this as AlunoModel, _$identity);

  /// Serializes this AlunoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlunoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.email, email) || other.email == email)&&(identical(other.fotoPerfil, fotoPerfil) || other.fotoPerfil == fotoPerfil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,email,fotoPerfil);

@override
String toString() {
  return 'AlunoModel(id: $id, nome: $nome, email: $email, fotoPerfil: $fotoPerfil)';
}


}

/// @nodoc
abstract mixin class $AlunoModelCopyWith<$Res>  {
  factory $AlunoModelCopyWith(AlunoModel value, $Res Function(AlunoModel) _then) = _$AlunoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) int? id, String nome, String email, String fotoPerfil
});




}
/// @nodoc
class _$AlunoModelCopyWithImpl<$Res>
    implements $AlunoModelCopyWith<$Res> {
  _$AlunoModelCopyWithImpl(this._self, this._then);

  final AlunoModel _self;
  final $Res Function(AlunoModel) _then;

/// Create a copy of AlunoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nome = null,Object? email = null,Object? fotoPerfil = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fotoPerfil: null == fotoPerfil ? _self.fotoPerfil : fotoPerfil // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AlunoModel].
extension AlunoModelPatterns on AlunoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlunoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlunoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlunoModel value)  $default,){
final _that = this;
switch (_that) {
case _AlunoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlunoModel value)?  $default,){
final _that = this;
switch (_that) {
case _AlunoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  int? id,  String nome,  String email,  String fotoPerfil)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlunoModel() when $default != null:
return $default(_that.id,_that.nome,_that.email,_that.fotoPerfil);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  int? id,  String nome,  String email,  String fotoPerfil)  $default,) {final _that = this;
switch (_that) {
case _AlunoModel():
return $default(_that.id,_that.nome,_that.email,_that.fotoPerfil);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  int? id,  String nome,  String email,  String fotoPerfil)?  $default,) {final _that = this;
switch (_that) {
case _AlunoModel() when $default != null:
return $default(_that.id,_that.nome,_that.email,_that.fotoPerfil);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AlunoModel implements AlunoModel {
  const _AlunoModel({@JsonKey(includeToJson: false) this.id, required this.nome, required this.email, required this.fotoPerfil});
  factory _AlunoModel.fromJson(Map<String, dynamic> json) => _$AlunoModelFromJson(json);

@override@JsonKey(includeToJson: false) final  int? id;
@override final  String nome;
@override final  String email;
@override final  String fotoPerfil;

/// Create a copy of AlunoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlunoModelCopyWith<_AlunoModel> get copyWith => __$AlunoModelCopyWithImpl<_AlunoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlunoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlunoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.email, email) || other.email == email)&&(identical(other.fotoPerfil, fotoPerfil) || other.fotoPerfil == fotoPerfil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,email,fotoPerfil);

@override
String toString() {
  return 'AlunoModel(id: $id, nome: $nome, email: $email, fotoPerfil: $fotoPerfil)';
}


}

/// @nodoc
abstract mixin class _$AlunoModelCopyWith<$Res> implements $AlunoModelCopyWith<$Res> {
  factory _$AlunoModelCopyWith(_AlunoModel value, $Res Function(_AlunoModel) _then) = __$AlunoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) int? id, String nome, String email, String fotoPerfil
});




}
/// @nodoc
class __$AlunoModelCopyWithImpl<$Res>
    implements _$AlunoModelCopyWith<$Res> {
  __$AlunoModelCopyWithImpl(this._self, this._then);

  final _AlunoModel _self;
  final $Res Function(_AlunoModel) _then;

/// Create a copy of AlunoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nome = null,Object? email = null,Object? fotoPerfil = null,}) {
  return _then(_AlunoModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fotoPerfil: null == fotoPerfil ? _self.fotoPerfil : fotoPerfil // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
