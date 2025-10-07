import 'package:freezed_annotation/freezed_annotation.dart';

part 'guide_state_model.freezed.dart';
part 'guide_state_model.g.dart';

/// 사용자 가이드 상태를 관리하는 모델
///
/// [showPlayScreenGuide] Play 화면 가이드 표시 여부
///
/// [showQuizModeGuide] Quiz 모드 가이드 표시 여부
@freezed
abstract class GuideStateModel with _$GuideStateModel {
  const factory GuideStateModel({
    @Default(true) bool showPlayScreenGuide,
    @Default(false) bool showQuizModeGuide,
  }) = _GuideStateModel;

  factory GuideStateModel.fromJson(Map<String, dynamic> json) =>
      _$GuideStateModelFromJson(json);
}
