// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preset_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresetStateModel {

 List<PresetModel> get presets; bool get isLoading; String? get error;
/// Create a copy of PresetStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetStateModelCopyWith<PresetStateModel> get copyWith => _$PresetStateModelCopyWithImpl<PresetStateModel>(this as PresetStateModel, _$identity);

  /// Serializes this PresetStateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetStateModel&&const DeepCollectionEquality().equals(other.presets, presets)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(presets),isLoading,error);

@override
String toString() {
  return 'PresetStateModel(presets: $presets, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $PresetStateModelCopyWith<$Res>  {
  factory $PresetStateModelCopyWith(PresetStateModel value, $Res Function(PresetStateModel) _then) = _$PresetStateModelCopyWithImpl;
@useResult
$Res call({
 List<PresetModel> presets, bool isLoading, String? error
});




}
/// @nodoc
class _$PresetStateModelCopyWithImpl<$Res>
    implements $PresetStateModelCopyWith<$Res> {
  _$PresetStateModelCopyWithImpl(this._self, this._then);

  final PresetStateModel _self;
  final $Res Function(PresetStateModel) _then;

/// Create a copy of PresetStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? presets = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
presets: null == presets ? _self.presets : presets // ignore: cast_nullable_to_non_nullable
as List<PresetModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PresetStateModel implements PresetStateModel {
  const _PresetStateModel({final  List<PresetModel> presets = const [], this.isLoading = false, this.error}): _presets = presets;
  factory _PresetStateModel.fromJson(Map<String, dynamic> json) => _$PresetStateModelFromJson(json);

 final  List<PresetModel> _presets;
@override@JsonKey() List<PresetModel> get presets {
  if (_presets is EqualUnmodifiableListView) return _presets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_presets);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of PresetStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresetStateModelCopyWith<_PresetStateModel> get copyWith => __$PresetStateModelCopyWithImpl<_PresetStateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresetStateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresetStateModel&&const DeepCollectionEquality().equals(other._presets, _presets)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_presets),isLoading,error);

@override
String toString() {
  return 'PresetStateModel(presets: $presets, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PresetStateModelCopyWith<$Res> implements $PresetStateModelCopyWith<$Res> {
  factory _$PresetStateModelCopyWith(_PresetStateModel value, $Res Function(_PresetStateModel) _then) = __$PresetStateModelCopyWithImpl;
@override @useResult
$Res call({
 List<PresetModel> presets, bool isLoading, String? error
});




}
/// @nodoc
class __$PresetStateModelCopyWithImpl<$Res>
    implements _$PresetStateModelCopyWith<$Res> {
  __$PresetStateModelCopyWithImpl(this._self, this._then);

  final _PresetStateModel _self;
  final $Res Function(_PresetStateModel) _then;

/// Create a copy of PresetStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? presets = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_PresetStateModel(
presets: null == presets ? _self._presets : presets // ignore: cast_nullable_to_non_nullable
as List<PresetModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
