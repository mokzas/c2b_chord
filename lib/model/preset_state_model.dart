import 'package:c2b_chord/model/preset_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preset_state_model.freezed.dart';
part 'preset_state_model.g.dart';

/// 프리셋 상태를 관리하는 모델
///
/// [presets] 모든 프리셋 리스트 (사용자 + 빌트인)
///
/// [isLoading] 프리셋 로딩 상태
///
/// [error] 에러 메시지
@freezed
abstract class PresetStateModel with _$PresetStateModel {
  const factory PresetStateModel({
    @Default([]) List<PresetModel> presets,
    @Default(false) bool isLoading,
    String? error,
  }) = _PresetStateModel;

  factory PresetStateModel.fromJson(Map<String, dynamic> json) =>
      _$PresetStateModelFromJson(json);
}
