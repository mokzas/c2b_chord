// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chord_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChordListItemModel {
  ChordModel get chord;
  bool get isSelected;

  /// Create a copy of ChordListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChordListItemModelCopyWith<ChordListItemModel> get copyWith =>
      _$ChordListItemModelCopyWithImpl<ChordListItemModel>(
          this as ChordListItemModel, _$identity);

  /// Serializes this ChordListItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChordListItemModel &&
            (identical(other.chord, chord) || other.chord == chord) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chord, isSelected);

  @override
  String toString() {
    return 'ChordListItemModel(chord: $chord, isSelected: $isSelected)';
  }
}

/// @nodoc
abstract mixin class $ChordListItemModelCopyWith<$Res> {
  factory $ChordListItemModelCopyWith(
          ChordListItemModel value, $Res Function(ChordListItemModel) _then) =
      _$ChordListItemModelCopyWithImpl;
  @useResult
  $Res call({ChordModel chord, bool isSelected});

  $ChordModelCopyWith<$Res> get chord;
}

/// @nodoc
class _$ChordListItemModelCopyWithImpl<$Res>
    implements $ChordListItemModelCopyWith<$Res> {
  _$ChordListItemModelCopyWithImpl(this._self, this._then);

  final ChordListItemModel _self;
  final $Res Function(ChordListItemModel) _then;

  /// Create a copy of ChordListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chord = null,
    Object? isSelected = null,
  }) {
    return _then(_self.copyWith(
      chord: null == chord
          ? _self.chord
          : chord // ignore: cast_nullable_to_non_nullable
              as ChordModel,
      isSelected: null == isSelected
          ? _self.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ChordListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChordModelCopyWith<$Res> get chord {
    return $ChordModelCopyWith<$Res>(_self.chord, (value) {
      return _then(_self.copyWith(chord: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ChordListItemModel implements ChordListItemModel {
  const _ChordListItemModel({required this.chord, required this.isSelected});
  factory _ChordListItemModel.fromJson(Map<String, dynamic> json) =>
      _$ChordListItemModelFromJson(json);

  @override
  final ChordModel chord;
  @override
  final bool isSelected;

  /// Create a copy of ChordListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChordListItemModelCopyWith<_ChordListItemModel> get copyWith =>
      __$ChordListItemModelCopyWithImpl<_ChordListItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChordListItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChordListItemModel &&
            (identical(other.chord, chord) || other.chord == chord) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chord, isSelected);

  @override
  String toString() {
    return 'ChordListItemModel(chord: $chord, isSelected: $isSelected)';
  }
}

/// @nodoc
abstract mixin class _$ChordListItemModelCopyWith<$Res>
    implements $ChordListItemModelCopyWith<$Res> {
  factory _$ChordListItemModelCopyWith(
          _ChordListItemModel value, $Res Function(_ChordListItemModel) _then) =
      __$ChordListItemModelCopyWithImpl;
  @override
  @useResult
  $Res call({ChordModel chord, bool isSelected});

  @override
  $ChordModelCopyWith<$Res> get chord;
}

/// @nodoc
class __$ChordListItemModelCopyWithImpl<$Res>
    implements _$ChordListItemModelCopyWith<$Res> {
  __$ChordListItemModelCopyWithImpl(this._self, this._then);

  final _ChordListItemModel _self;
  final $Res Function(_ChordListItemModel) _then;

  /// Create a copy of ChordListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chord = null,
    Object? isSelected = null,
  }) {
    return _then(_ChordListItemModel(
      chord: null == chord
          ? _self.chord
          : chord // ignore: cast_nullable_to_non_nullable
              as ChordModel,
      isSelected: null == isSelected
          ? _self.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ChordListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChordModelCopyWith<$Res> get chord {
    return $ChordModelCopyWith<$Res>(_self.chord, (value) {
      return _then(_self.copyWith(chord: value));
    });
  }
}

// dart format on
