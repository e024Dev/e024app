// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aluno_projeto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlunoProjetoModel {

 String get papel;@JsonKey(name: 'alunos') AlunoModel get aluno;
/// Create a copy of AlunoProjetoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlunoProjetoModelCopyWith<AlunoProjetoModel> get copyWith => _$AlunoProjetoModelCopyWithImpl<AlunoProjetoModel>(this as AlunoProjetoModel, _$identity);

  /// Serializes this AlunoProjetoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlunoProjetoModel&&(identical(other.papel, papel) || other.papel == papel)&&(identical(other.aluno, aluno) || other.aluno == aluno));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,papel,aluno);

@override
String toString() {
  return 'AlunoProjetoModel(papel: $papel, aluno: $aluno)';
}


}

/// @nodoc
abstract mixin class $AlunoProjetoModelCopyWith<$Res>  {
  factory $AlunoProjetoModelCopyWith(AlunoProjetoModel value, $Res Function(AlunoProjetoModel) _then) = _$AlunoProjetoModelCopyWithImpl;
@useResult
$Res call({
 String papel,@JsonKey(name: 'alunos') AlunoModel aluno
});


$AlunoModelCopyWith<$Res> get aluno;

}
/// @nodoc
class _$AlunoProjetoModelCopyWithImpl<$Res>
    implements $AlunoProjetoModelCopyWith<$Res> {
  _$AlunoProjetoModelCopyWithImpl(this._self, this._then);

  final AlunoProjetoModel _self;
  final $Res Function(AlunoProjetoModel) _then;

/// Create a copy of AlunoProjetoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? papel = null,Object? aluno = null,}) {
  return _then(_self.copyWith(
papel: null == papel ? _self.papel : papel // ignore: cast_nullable_to_non_nullable
as String,aluno: null == aluno ? _self.aluno : aluno // ignore: cast_nullable_to_non_nullable
as AlunoModel,
  ));
}
/// Create a copy of AlunoProjetoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlunoModelCopyWith<$Res> get aluno {
  
  return $AlunoModelCopyWith<$Res>(_self.aluno, (value) {
    return _then(_self.copyWith(aluno: value));
  });
}
}


/// Adds pattern-matching-related methods to [AlunoProjetoModel].
extension AlunoProjetoModelPatterns on AlunoProjetoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlunoProjetoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlunoProjetoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlunoProjetoModel value)  $default,){
final _that = this;
switch (_that) {
case _AlunoProjetoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlunoProjetoModel value)?  $default,){
final _that = this;
switch (_that) {
case _AlunoProjetoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String papel, @JsonKey(name: 'alunos')  AlunoModel aluno)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlunoProjetoModel() when $default != null:
return $default(_that.papel,_that.aluno);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String papel, @JsonKey(name: 'alunos')  AlunoModel aluno)  $default,) {final _that = this;
switch (_that) {
case _AlunoProjetoModel():
return $default(_that.papel,_that.aluno);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String papel, @JsonKey(name: 'alunos')  AlunoModel aluno)?  $default,) {final _that = this;
switch (_that) {
case _AlunoProjetoModel() when $default != null:
return $default(_that.papel,_that.aluno);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlunoProjetoModel implements AlunoProjetoModel {
  const _AlunoProjetoModel({required this.papel, @JsonKey(name: 'alunos') required this.aluno});
  factory _AlunoProjetoModel.fromJson(Map<String, dynamic> json) => _$AlunoProjetoModelFromJson(json);

@override final  String papel;
@override@JsonKey(name: 'alunos') final  AlunoModel aluno;

/// Create a copy of AlunoProjetoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlunoProjetoModelCopyWith<_AlunoProjetoModel> get copyWith => __$AlunoProjetoModelCopyWithImpl<_AlunoProjetoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlunoProjetoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlunoProjetoModel&&(identical(other.papel, papel) || other.papel == papel)&&(identical(other.aluno, aluno) || other.aluno == aluno));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,papel,aluno);

@override
String toString() {
  return 'AlunoProjetoModel(papel: $papel, aluno: $aluno)';
}


}

/// @nodoc
abstract mixin class _$AlunoProjetoModelCopyWith<$Res> implements $AlunoProjetoModelCopyWith<$Res> {
  factory _$AlunoProjetoModelCopyWith(_AlunoProjetoModel value, $Res Function(_AlunoProjetoModel) _then) = __$AlunoProjetoModelCopyWithImpl;
@override @useResult
$Res call({
 String papel,@JsonKey(name: 'alunos') AlunoModel aluno
});


@override $AlunoModelCopyWith<$Res> get aluno;

}
/// @nodoc
class __$AlunoProjetoModelCopyWithImpl<$Res>
    implements _$AlunoProjetoModelCopyWith<$Res> {
  __$AlunoProjetoModelCopyWithImpl(this._self, this._then);

  final _AlunoProjetoModel _self;
  final $Res Function(_AlunoProjetoModel) _then;

/// Create a copy of AlunoProjetoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? papel = null,Object? aluno = null,}) {
  return _then(_AlunoProjetoModel(
papel: null == papel ? _self.papel : papel // ignore: cast_nullable_to_non_nullable
as String,aluno: null == aluno ? _self.aluno : aluno // ignore: cast_nullable_to_non_nullable
as AlunoModel,
  ));
}

/// Create a copy of AlunoProjetoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlunoModelCopyWith<$Res> get aluno {
  
  return $AlunoModelCopyWith<$Res>(_self.aluno, (value) {
    return _then(_self.copyWith(aluno: value));
  });
}
}

// dart format on
