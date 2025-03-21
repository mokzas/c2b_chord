// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quality_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QualityModel {
  String get name;
  List<String> get aliases;
  List<int> get intervals;
  List<String> get notation;

  /// Create a copy of QualityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QualityModelCopyWith<QualityModel> get copyWith =>
      _$QualityModelCopyWithImpl<QualityModel>(
          this as QualityModel, _$identity);

  /// Serializes this QualityModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QualityModel &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.aliases, aliases) &&
            const DeepCollectionEquality().equals(other.intervals, intervals) &&
            const DeepCollectionEquality().equals(other.notation, notation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(aliases),
      const DeepCollectionEquality().hash(intervals),
      const DeepCollectionEquality().hash(notation));

  @override
  String toString() {
    return 'QualityModel(name: $name, aliases: $aliases, intervals: $intervals, notation: $notation)';
  }
}

/// @nodoc
abstract mixin class $QualityModelCopyWith<$Res> {
  factory $QualityModelCopyWith(
          QualityModel value, $Res Function(QualityModel) _then) =
      _$QualityModelCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      List<String> aliases,
      List<int> intervals,
      List<String> notation});
}

/// @nodoc
class _$QualityModelCopyWithImpl<$Res> implements $QualityModelCopyWith<$Res> {
  _$QualityModelCopyWithImpl(this._self, this._then);

  final QualityModel _self;
  final $Res Function(QualityModel) _then;

  /// Create a copy of QualityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? aliases = null,
    Object? intervals = null,
    Object? notation = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      aliases: null == aliases
          ? _self.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>,
      intervals: null == intervals
          ? _self.intervals
          : intervals // ignore: cast_nullable_to_non_nullable
              as List<int>,
      notation: null == notation
          ? _self.notation
          : notation // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QualityModel implements QualityModel {
  const _QualityModel(
      {required this.name,
      required final List<String> aliases,
      required final List<int> intervals,
      required final List<String> notation})
      : _aliases = aliases,
        _intervals = intervals,
        _notation = notation;
  factory _QualityModel.fromJson(Map<String, dynamic> json) =>
      _$QualityModelFromJson(json);

  @override
  final String name;
  final List<String> _aliases;
  @override
  List<String> get aliases {
    if (_aliases is EqualUnmodifiableListView) return _aliases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aliases);
  }

  final List<int> _intervals;
  @override
  List<int> get intervals {
    if (_intervals is EqualUnmodifiableListView) return _intervals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intervals);
  }

  final List<String> _notation;
  @override
  List<String> get notation {
    if (_notation is EqualUnmodifiableListView) return _notation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notation);
  }

  /// Create a copy of QualityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QualityModelCopyWith<_QualityModel> get copyWith =>
      __$QualityModelCopyWithImpl<_QualityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QualityModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QualityModel &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._aliases, _aliases) &&
            const DeepCollectionEquality()
                .equals(other._intervals, _intervals) &&
            const DeepCollectionEquality().equals(other._notation, _notation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_aliases),
      const DeepCollectionEquality().hash(_intervals),
      const DeepCollectionEquality().hash(_notation));

  @override
  String toString() {
    return 'QualityModel(name: $name, aliases: $aliases, intervals: $intervals, notation: $notation)';
  }
}

/// @nodoc
abstract mixin class _$QualityModelCopyWith<$Res>
    implements $QualityModelCopyWith<$Res> {
  factory _$QualityModelCopyWith(
          _QualityModel value, $Res Function(_QualityModel) _then) =
      __$QualityModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      List<String> aliases,
      List<int> intervals,
      List<String> notation});
}

/// @nodoc
class __$QualityModelCopyWithImpl<$Res>
    implements _$QualityModelCopyWith<$Res> {
  __$QualityModelCopyWithImpl(this._self, this._then);

  final _QualityModel _self;
  final $Res Function(_QualityModel) _then;

  /// Create a copy of QualityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? aliases = null,
    Object? intervals = null,
    Object? notation = null,
  }) {
    return _then(_QualityModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      aliases: null == aliases
          ? _self._aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>,
      intervals: null == intervals
          ? _self._intervals
          : intervals // ignore: cast_nullable_to_non_nullable
              as List<int>,
      notation: null == notation
          ? _self._notation
          : notation // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
