// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayStateModel {
  bool get isPlaying;
  int get bpm;
  int get volume;
  int get timeSignature;
  int get currentTick;

  /// Create a copy of PlayStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayStateModelCopyWith<PlayStateModel> get copyWith =>
      _$PlayStateModelCopyWithImpl<PlayStateModel>(
          this as PlayStateModel, _$identity);

  /// Serializes this PlayStateModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayStateModel &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.bpm, bpm) || other.bpm == bpm) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.timeSignature, timeSignature) ||
                other.timeSignature == timeSignature) &&
            (identical(other.currentTick, currentTick) ||
                other.currentTick == currentTick));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, isPlaying, bpm, volume, timeSignature, currentTick);

  @override
  String toString() {
    return 'PlayStateModel(isPlaying: $isPlaying, bpm: $bpm, volume: $volume, timeSignature: $timeSignature, currentTick: $currentTick)';
  }
}

/// @nodoc
abstract mixin class $PlayStateModelCopyWith<$Res> {
  factory $PlayStateModelCopyWith(
          PlayStateModel value, $Res Function(PlayStateModel) _then) =
      _$PlayStateModelCopyWithImpl;
  @useResult
  $Res call(
      {bool isPlaying,
      int bpm,
      int volume,
      int timeSignature,
      int currentTick});
}

/// @nodoc
class _$PlayStateModelCopyWithImpl<$Res>
    implements $PlayStateModelCopyWith<$Res> {
  _$PlayStateModelCopyWithImpl(this._self, this._then);

  final PlayStateModel _self;
  final $Res Function(PlayStateModel) _then;

  /// Create a copy of PlayStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? bpm = null,
    Object? volume = null,
    Object? timeSignature = null,
    Object? currentTick = null,
  }) {
    return _then(_self.copyWith(
      isPlaying: null == isPlaying
          ? _self.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      bpm: null == bpm
          ? _self.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
      volume: null == volume
          ? _self.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      timeSignature: null == timeSignature
          ? _self.timeSignature
          : timeSignature // ignore: cast_nullable_to_non_nullable
              as int,
      currentTick: null == currentTick
          ? _self.currentTick
          : currentTick // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PlayStateModel implements PlayStateModel {
  const _PlayStateModel(
      {this.isPlaying = false,
      this.bpm = 120,
      this.volume = 50,
      this.timeSignature = 6,
      this.currentTick = 0});
  factory _PlayStateModel.fromJson(Map<String, dynamic> json) =>
      _$PlayStateModelFromJson(json);

  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final int bpm;
  @override
  @JsonKey()
  final int volume;
  @override
  @JsonKey()
  final int timeSignature;
  @override
  @JsonKey()
  final int currentTick;

  /// Create a copy of PlayStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlayStateModelCopyWith<_PlayStateModel> get copyWith =>
      __$PlayStateModelCopyWithImpl<_PlayStateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlayStateModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayStateModel &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.bpm, bpm) || other.bpm == bpm) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.timeSignature, timeSignature) ||
                other.timeSignature == timeSignature) &&
            (identical(other.currentTick, currentTick) ||
                other.currentTick == currentTick));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, isPlaying, bpm, volume, timeSignature, currentTick);

  @override
  String toString() {
    return 'PlayStateModel(isPlaying: $isPlaying, bpm: $bpm, volume: $volume, timeSignature: $timeSignature, currentTick: $currentTick)';
  }
}

/// @nodoc
abstract mixin class _$PlayStateModelCopyWith<$Res>
    implements $PlayStateModelCopyWith<$Res> {
  factory _$PlayStateModelCopyWith(
          _PlayStateModel value, $Res Function(_PlayStateModel) _then) =
      __$PlayStateModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isPlaying,
      int bpm,
      int volume,
      int timeSignature,
      int currentTick});
}

/// @nodoc
class __$PlayStateModelCopyWithImpl<$Res>
    implements _$PlayStateModelCopyWith<$Res> {
  __$PlayStateModelCopyWithImpl(this._self, this._then);

  final _PlayStateModel _self;
  final $Res Function(_PlayStateModel) _then;

  /// Create a copy of PlayStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isPlaying = null,
    Object? bpm = null,
    Object? volume = null,
    Object? timeSignature = null,
    Object? currentTick = null,
  }) {
    return _then(_PlayStateModel(
      isPlaying: null == isPlaying
          ? _self.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      bpm: null == bpm
          ? _self.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
      volume: null == volume
          ? _self.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      timeSignature: null == timeSignature
          ? _self.timeSignature
          : timeSignature // ignore: cast_nullable_to_non_nullable
              as int,
      currentTick: null == currentTick
          ? _self.currentTick
          : currentTick // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
