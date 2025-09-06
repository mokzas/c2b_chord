// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chord_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChordModel {

 String get name; List<String> get nameAlt; Note get root; List<Note> get tones; String get qualityName;
/// Create a copy of ChordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChordModelCopyWith<ChordModel> get copyWith => _$ChordModelCopyWithImpl<ChordModel>(this as ChordModel, _$identity);

  /// Serializes this ChordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChordModel&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.nameAlt, nameAlt)&&(identical(other.root, root) || other.root == root)&&const DeepCollectionEquality().equals(other.tones, tones)&&(identical(other.qualityName, qualityName) || other.qualityName == qualityName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(nameAlt),root,const DeepCollectionEquality().hash(tones),qualityName);

@override
String toString() {
  return 'ChordModel(name: $name, nameAlt: $nameAlt, root: $root, tones: $tones, qualityName: $qualityName)';
}


}

/// @nodoc
abstract mixin class $ChordModelCopyWith<$Res>  {
  factory $ChordModelCopyWith(ChordModel value, $Res Function(ChordModel) _then) = _$ChordModelCopyWithImpl;
@useResult
$Res call({
 String name, List<String> nameAlt, Note root, List<Note> tones, String qualityName
});




}
/// @nodoc
class _$ChordModelCopyWithImpl<$Res>
    implements $ChordModelCopyWith<$Res> {
  _$ChordModelCopyWithImpl(this._self, this._then);

  final ChordModel _self;
  final $Res Function(ChordModel) _then;

/// Create a copy of ChordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? nameAlt = null,Object? root = null,Object? tones = null,Object? qualityName = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameAlt: null == nameAlt ? _self.nameAlt : nameAlt // ignore: cast_nullable_to_non_nullable
as List<String>,root: null == root ? _self.root : root // ignore: cast_nullable_to_non_nullable
as Note,tones: null == tones ? _self.tones : tones // ignore: cast_nullable_to_non_nullable
as List<Note>,qualityName: null == qualityName ? _self.qualityName : qualityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ChordModel implements ChordModel {
  const _ChordModel({required this.name, required final  List<String> nameAlt, required this.root, required final  List<Note> tones, required this.qualityName}): _nameAlt = nameAlt,_tones = tones;
  factory _ChordModel.fromJson(Map<String, dynamic> json) => _$ChordModelFromJson(json);

@override final  String name;
 final  List<String> _nameAlt;
@override List<String> get nameAlt {
  if (_nameAlt is EqualUnmodifiableListView) return _nameAlt;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nameAlt);
}

@override final  Note root;
 final  List<Note> _tones;
@override List<Note> get tones {
  if (_tones is EqualUnmodifiableListView) return _tones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tones);
}

@override final  String qualityName;

/// Create a copy of ChordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChordModelCopyWith<_ChordModel> get copyWith => __$ChordModelCopyWithImpl<_ChordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChordModel&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._nameAlt, _nameAlt)&&(identical(other.root, root) || other.root == root)&&const DeepCollectionEquality().equals(other._tones, _tones)&&(identical(other.qualityName, qualityName) || other.qualityName == qualityName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_nameAlt),root,const DeepCollectionEquality().hash(_tones),qualityName);

@override
String toString() {
  return 'ChordModel(name: $name, nameAlt: $nameAlt, root: $root, tones: $tones, qualityName: $qualityName)';
}


}

/// @nodoc
abstract mixin class _$ChordModelCopyWith<$Res> implements $ChordModelCopyWith<$Res> {
  factory _$ChordModelCopyWith(_ChordModel value, $Res Function(_ChordModel) _then) = __$ChordModelCopyWithImpl;
@override @useResult
$Res call({
 String name, List<String> nameAlt, Note root, List<Note> tones, String qualityName
});




}
/// @nodoc
class __$ChordModelCopyWithImpl<$Res>
    implements _$ChordModelCopyWith<$Res> {
  __$ChordModelCopyWithImpl(this._self, this._then);

  final _ChordModel _self;
  final $Res Function(_ChordModel) _then;

/// Create a copy of ChordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? nameAlt = null,Object? root = null,Object? tones = null,Object? qualityName = null,}) {
  return _then(_ChordModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameAlt: null == nameAlt ? _self._nameAlt : nameAlt // ignore: cast_nullable_to_non_nullable
as List<String>,root: null == root ? _self.root : root // ignore: cast_nullable_to_non_nullable
as Note,tones: null == tones ? _self._tones : tones // ignore: cast_nullable_to_non_nullable
as List<Note>,qualityName: null == qualityName ? _self.qualityName : qualityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
