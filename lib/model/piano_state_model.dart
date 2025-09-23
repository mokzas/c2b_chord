import 'package:freezed_annotation/freezed_annotation.dart';

part 'piano_state_model.freezed.dart';
part 'piano_state_model.g.dart';

/// 피아노 건반 상태를 관리하는 모델
///
/// [pressedKeys] 눌린 건반들의 MIDI 번호 집합
@freezed
abstract class PianoStateModel with _$PianoStateModel {
  const factory PianoStateModel({@Default({}) Set<int> pressedKeys}) =
      _PianoStateModel;

  factory PianoStateModel.fromJson(Map<String, dynamic> json) =>
      _$PianoStateModelFromJson(json);
}
