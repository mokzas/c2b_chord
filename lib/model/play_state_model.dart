import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_state_model.freezed.dart';
part 'play_state_model.g.dart';

/// 연습 중 메트로놈 재생, 악보(chord) 넘기기 등에 필요한 상태 정보.
///
/// [isPlaying] 메트로놈 재생 여부.
///
/// [bpm] 메트로놈 속도.
///
/// [volume] 메트로놈 볼륨. (0 ~ 100)
///
/// [timeSignature] 한 chord당 메트로놈 tick 수.
///
/// [currentTick] 메트로놈 현재 tick. (0 ~ timeSignature-1)
///
/// [displayChordCount] 화면에 표시할 chord 수.
///
/// [currentChordIndex] 현재 연주할 chord 인덱스.
@freezed
abstract class PlayStateModel with _$PlayStateModel {
  const factory PlayStateModel({
    @Default(false) bool isPlaying,
    @Default(120) int bpm,
    @Default(50) int volume,
    @Default(6) int timeSignature,
    @Default(0) int currentTick,
    @Default(8) int displayChordCount,
    @Default(0) int currentChordIndex,
  }) = _PlayStateModel;

  factory PlayStateModel.fromJson(Map<String, dynamic> json) =>
      _$PlayStateModelFromJson(json);
}
