// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prodeto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjetoModel {

@JsonKey(includeToJson: false) int? get id; String get titulo; String get descricao;@JsonKey(name: 'link_externo') String get url;@JsonKey(name: 'imagem_capa') String get urlImagem;@JsonKey(name: 'cursos') CursoModel get curso;
/// Create a copy of ProjetoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjetoModelCopyWith<ProjetoModel> get copyWith => _$ProjetoModelCopyWithImpl<ProjetoModel>(this as ProjetoModel, _$identity);

  /// Serializes this ProjetoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjetoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlImagem, urlImagem) || other.urlImagem == urlImagem)&&(identical(other.curso, curso) || other.curso == curso));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,descricao,url,urlImagem,curso);

@override
String toString() {
  return 'ProjetoModel(id: $id, titulo: $titulo, descricao: $descricao, url: $url, urlImagem: $urlImagem, curso: $curso)';
}


}

/// @nodoc
abstract mixin class $ProjetoModelCopyWith<$Res>  {
  factory $ProjetoModelCopyWith(ProjetoModel value, $Res Function(ProjetoModel) _then) = _$ProjetoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) int? id, String titulo, String descricao,@JsonKey(name: 'link_externo') String url,@JsonKey(name: 'imagem_capa') String urlImagem,@JsonKey(name: 'cursos') CursoModel curso
});


$CursoModelCopyWith<$Res> get curso;

}
/// @nodoc
class _$ProjetoModelCopyWithImpl<$Res>
    implements $ProjetoModelCopyWith<$Res> {
  _$ProjetoModelCopyWithImpl(this._self, this._then);

  final ProjetoModel _self;
  final $Res Function(ProjetoModel) _then;

/// Create a copy of ProjetoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? titulo = null,Object? descricao = null,Object? url = null,Object? urlImagem = null,Object? curso = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlImagem: null == urlImagem ? _self.urlImagem : urlImagem // ignore: cast_nullable_to_non_nullable
as String,curso: null == curso ? _self.curso : curso // ignore: cast_nullable_to_non_nullable
as CursoModel,
  ));
}
/// Create a copy of ProjetoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CursoModelCopyWith<$Res> get curso {
  
  return $CursoModelCopyWith<$Res>(_self.curso, (value) {
    return _then(_self.copyWith(curso: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjetoModel].
extension ProjetoModelPatterns on ProjetoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjetoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjetoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjetoModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjetoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjetoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjetoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  int? id,  String titulo,  String descricao, @JsonKey(name: 'link_externo')  String url, @JsonKey(name: 'imagem_capa')  String urlImagem, @JsonKey(name: 'cursos')  CursoModel curso)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjetoModel() when $default != null:
return $default(_that.id,_that.titulo,_that.descricao,_that.url,_that.urlImagem,_that.curso);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  int? id,  String titulo,  String descricao, @JsonKey(name: 'link_externo')  String url, @JsonKey(name: 'imagem_capa')  String urlImagem, @JsonKey(name: 'cursos')  CursoModel curso)  $default,) {final _that = this;
switch (_that) {
case _ProjetoModel():
return $default(_that.id,_that.titulo,_that.descricao,_that.url,_that.urlImagem,_that.curso);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  int? id,  String titulo,  String descricao, @JsonKey(name: 'link_externo')  String url, @JsonKey(name: 'imagem_capa')  String urlImagem, @JsonKey(name: 'cursos')  CursoModel curso)?  $default,) {final _that = this;
switch (_that) {
case _ProjetoModel() when $default != null:
return $default(_that.id,_that.titulo,_that.descricao,_that.url,_that.urlImagem,_that.curso);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ProjetoModel implements ProjetoModel {
  const _ProjetoModel({@JsonKey(includeToJson: false) this.id, required this.titulo, required this.descricao, @JsonKey(name: 'link_externo') required this.url, @JsonKey(name: 'imagem_capa') required this.urlImagem, @JsonKey(name: 'cursos') required this.curso});
  factory _ProjetoModel.fromJson(Map<String, dynamic> json) => _$ProjetoModelFromJson(json);

@override@JsonKey(includeToJson: false) final  int? id;
@override final  String titulo;
@override final  String descricao;
@override@JsonKey(name: 'link_externo') final  String url;
@override@JsonKey(name: 'imagem_capa') final  String urlImagem;
@override@JsonKey(name: 'cursos') final  CursoModel curso;

/// Create a copy of ProjetoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjetoModelCopyWith<_ProjetoModel> get copyWith => __$ProjetoModelCopyWithImpl<_ProjetoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjetoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjetoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlImagem, urlImagem) || other.urlImagem == urlImagem)&&(identical(other.curso, curso) || other.curso == curso));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,descricao,url,urlImagem,curso);

@override
String toString() {
  return 'ProjetoModel(id: $id, titulo: $titulo, descricao: $descricao, url: $url, urlImagem: $urlImagem, curso: $curso)';
}


}

/// @nodoc
abstract mixin class _$ProjetoModelCopyWith<$Res> implements $ProjetoModelCopyWith<$Res> {
  factory _$ProjetoModelCopyWith(_ProjetoModel value, $Res Function(_ProjetoModel) _then) = __$ProjetoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) int? id, String titulo, String descricao,@JsonKey(name: 'link_externo') String url,@JsonKey(name: 'imagem_capa') String urlImagem,@JsonKey(name: 'cursos') CursoModel curso
});


@override $CursoModelCopyWith<$Res> get curso;

}
/// @nodoc
class __$ProjetoModelCopyWithImpl<$Res>
    implements _$ProjetoModelCopyWith<$Res> {
  __$ProjetoModelCopyWithImpl(this._self, this._then);

  final _ProjetoModel _self;
  final $Res Function(_ProjetoModel) _then;

/// Create a copy of ProjetoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? titulo = null,Object? descricao = null,Object? url = null,Object? urlImagem = null,Object? curso = null,}) {
  return _then(_ProjetoModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlImagem: null == urlImagem ? _self.urlImagem : urlImagem // ignore: cast_nullable_to_non_nullable
as String,curso: null == curso ? _self.curso : curso // ignore: cast_nullable_to_non_nullable
as CursoModel,
  ));
}

/// Create a copy of ProjetoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CursoModelCopyWith<$Res> get curso {
  
  return $CursoModelCopyWith<$Res>(_self.curso, (value) {
    return _then(_self.copyWith(curso: value));
  });
}
}

// dart format on
