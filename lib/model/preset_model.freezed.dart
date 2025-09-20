// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresetModel {

 String get id; String get name; PresetType get type; String get path; List<ChordModel> get chordList; DateTime get createdAt; DateTime get updatedAt; String? get description;
/// Create a copy of PresetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetModelCopyWith<PresetModel> get copyWith => _$PresetModelCopyWithImpl<PresetModel>(this as PresetModel, _$identity);

  /// Serializes this PresetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.chordList, chordList)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,path,const DeepCollectionEquality().hash(chordList),createdAt,updatedAt,description);

@override
String toString() {
  return 'PresetModel(id: $id, name: $name, type: $type, path: $path, chordList: $chordList, createdAt: $createdAt, updatedAt: $updatedAt, description: $description)';
}


}

/// @nodoc
abstract mixin class $PresetModelCopyWith<$Res>  {
  factory $PresetModelCopyWith(PresetModel value, $Res Function(PresetModel) _then) = _$PresetModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, PresetType type, String path, List<ChordModel> chordList, DateTime createdAt, DateTime updatedAt, String? description
});




}
/// @nodoc
class _$PresetModelCopyWithImpl<$Res>
    implements $PresetModelCopyWith<$Res> {
  _$PresetModelCopyWithImpl(this._self, this._then);

  final PresetModel _self;
  final $Res Function(PresetModel) _then;

/// Create a copy of PresetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? path = null,Object? chordList = null,Object? createdAt = null,Object? updatedAt = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PresetType,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,chordList: null == chordList ? _self.chordList : chordList // ignore: cast_nullable_to_non_nullable
as List<ChordModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PresetModel implements PresetModel {
  const _PresetModel({required this.id, required this.name, required this.type, required this.path, required final  List<ChordModel> chordList, required this.createdAt, required this.updatedAt, this.description}): _chordList = chordList;
  factory _PresetModel.fromJson(Map<String, dynamic> json) => _$PresetModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  PresetType type;
@override final  String path;
 final  List<ChordModel> _chordList;
@override List<ChordModel> get chordList {
  if (_chordList is EqualUnmodifiableListView) return _chordList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chordList);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? description;

/// Create a copy of PresetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresetModelCopyWith<_PresetModel> get copyWith => __$PresetModelCopyWithImpl<_PresetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other._chordList, _chordList)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,path,const DeepCollectionEquality().hash(_chordList),createdAt,updatedAt,description);

@override
String toString() {
  return 'PresetModel(id: $id, name: $name, type: $type, path: $path, chordList: $chordList, createdAt: $createdAt, updatedAt: $updatedAt, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PresetModelCopyWith<$Res> implements $PresetModelCopyWith<$Res> {
  factory _$PresetModelCopyWith(_PresetModel value, $Res Function(_PresetModel) _then) = __$PresetModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, PresetType type, String path, List<ChordModel> chordList, DateTime createdAt, DateTime updatedAt, String? description
});




}
/// @nodoc
class __$PresetModelCopyWithImpl<$Res>
    implements _$PresetModelCopyWith<$Res> {
  __$PresetModelCopyWithImpl(this._self, this._then);

  final _PresetModel _self;
  final $Res Function(_PresetModel) _then;

/// Create a copy of PresetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? path = null,Object? chordList = null,Object? createdAt = null,Object? updatedAt = null,Object? description = freezed,}) {
  return _then(_PresetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PresetType,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,chordList: null == chordList ? _self._chordList : chordList // ignore: cast_nullable_to_non_nullable
as List<ChordModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
