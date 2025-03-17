// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chord.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chord {
  String get name;
  List<String> get nameAlt;

  /// Create a copy of Chord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChordCopyWith<Chord> get copyWith =>
      _$ChordCopyWithImpl<Chord>(this as Chord, _$identity);

  /// Serializes this Chord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Chord &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.nameAlt, nameAlt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(nameAlt));

  @override
  String toString() {
    return 'Chord(name: $name, nameAlt: $nameAlt)';
  }
}

/// @nodoc
abstract mixin class $ChordCopyWith<$Res> {
  factory $ChordCopyWith(Chord value, $Res Function(Chord) _then) =
      _$ChordCopyWithImpl;
  @useResult
  $Res call({String name, List<String> nameAlt});
}

/// @nodoc
class _$ChordCopyWithImpl<$Res> implements $ChordCopyWith<$Res> {
  _$ChordCopyWithImpl(this._self, this._then);

  final Chord _self;
  final $Res Function(Chord) _then;

  /// Create a copy of Chord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameAlt = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameAlt: null == nameAlt
          ? _self.nameAlt
          : nameAlt // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Chord implements Chord {
  const _Chord({required this.name, required final List<String> nameAlt})
      : _nameAlt = nameAlt;
  factory _Chord.fromJson(Map<String, dynamic> json) => _$ChordFromJson(json);

  @override
  final String name;
  final List<String> _nameAlt;
  @override
  List<String> get nameAlt {
    if (_nameAlt is EqualUnmodifiableListView) return _nameAlt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nameAlt);
  }

  /// Create a copy of Chord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChordCopyWith<_Chord> get copyWith =>
      __$ChordCopyWithImpl<_Chord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Chord &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._nameAlt, _nameAlt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_nameAlt));

  @override
  String toString() {
    return 'Chord(name: $name, nameAlt: $nameAlt)';
  }
}

/// @nodoc
abstract mixin class _$ChordCopyWith<$Res> implements $ChordCopyWith<$Res> {
  factory _$ChordCopyWith(_Chord value, $Res Function(_Chord) _then) =
      __$ChordCopyWithImpl;
  @override
  @useResult
  $Res call({String name, List<String> nameAlt});
}

/// @nodoc
class __$ChordCopyWithImpl<$Res> implements _$ChordCopyWith<$Res> {
  __$ChordCopyWithImpl(this._self, this._then);

  final _Chord _self;
  final $Res Function(_Chord) _then;

  /// Create a copy of Chord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? nameAlt = null,
  }) {
    return _then(_Chord(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameAlt: null == nameAlt
          ? _self._nameAlt
          : nameAlt // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
