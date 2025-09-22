import 'package:c2b_chord/model/chord_model.dart';
import 'package:c2b_chord/model/preset_model.dart';
import 'package:c2b_chord/model/preset_state_model.dart';
import 'package:c2b_chord/repository/preset_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preset_state_provider.g.dart';

/// 프리셋 상태를 관리하는 Provider
@riverpod
class PresetState extends _$PresetState {
  @override
  PresetStateModel build() {
    // 초기 상태에서 프리셋들을 로드
    Future.microtask(() => _loadPresets());
    return const PresetStateModel();
  }

  /// 프리셋들을 로드
  Future<void> _loadPresets() async {
    _setLoading(true);

    try {
      final userPresets = await PresetRepository.loadUserPresets();
      final builtinPresets = await PresetRepository.loadBuiltinPresets();
      final allPresets = [...userPresets, ...builtinPresets];

      state = state.copyWith(
        presets: allPresets,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      _setError(e.toString());
    }
  }

  /// 사용자 커스텀 프리셋 저장
  ///
  /// [preset] 저장할 프리셋 모델. 기존 프리셋을 업데이트 하는 경우 필요
  ///
  /// [name] 프리셋 이름. 새 프리셋을 생성하는 경우 필요
  ///
  /// [chordList] 프리셋에 포함된 코드 리스트. 새 프리셋을 생성하는 경우 필요
  ///
  /// [description] 프리셋 설명.
  ///
  Future<bool> saveUserPreset({
    required String name,
    required List<ChordModel> chordList,
  }) async {
    try {
      PresetModel presetToSave = PresetRepository.createPreset(
        name: name,
        chordList: chordList,
      );

      await PresetRepository.saveUserPreset(presetToSave);
      await _loadPresets();
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    }
  }

  /// 로딩 상태 설정
  void _setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading, error: null);
  }

  /// 에러 상태 설정
  void _setError(String error) {
    state = state.copyWith(isLoading: false, error: error);
  }
}
