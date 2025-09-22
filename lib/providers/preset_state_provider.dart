import 'package:c2b_chord/model/chord_model.dart';
import 'package:c2b_chord/model/preset_model.dart';
import 'package:c2b_chord/model/preset_state_model.dart';
import 'package:c2b_chord/providers/chord_list_provider.dart';
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
  /// [name] 프리셋 이름
  ///
  /// [chordList] 프리셋에 포함된 코드 리스트
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

  /// 폴더 경로에 폴더 추가
  void enterFolder(String folderName) {
    state = state.copyWith(folderPath: [...state.folderPath, folderName]);
  }

  /// 폴더 경로에서 특정 인덱스까지로 이동
  void navigateToFolder(int index) {
    state = state.copyWith(
      folderPath: state.folderPath.take(index + 1).toList(),
    );
  }

  /// 최상위 폴더로 이동
  void goToRoot() {
    state = state.copyWith(folderPath: []);
  }

  /// 현재 폴더 경로에서 폴더명 추출
  String _getFolderName(String path) {
    if (path.isEmpty) return 'Root';
    return path.split('/').last;
  }

  /// 현재 폴더에 해당하는 프리셋들만 필터링하여 반환
  List<PresetModel> getCurrentFolderPresets() {
    if (state.folderPath.isEmpty) {
      // 최상위 폴더: 폴더별로 그룹화된 프리셋들
      final Map<String, List<PresetModel>> groupedPresets = {};
      final Map<String, String> folderNameToPath = {}; // 폴더명 -> 실제 path 매핑

      for (final preset in state.presets) {
        final folderName = _getFolderName(preset.path);
        groupedPresets.putIfAbsent(folderName, () => []).add(preset);
        // 첫 번째 프리셋의 path를 해당 폴더의 실제 path로 저장
        folderNameToPath[folderName] = preset.path;
      }

      return groupedPresets.keys.map((folderName) {
        final folderPath = folderNameToPath[folderName] ?? folderName;
        return PresetModel(
          id: folderName,
          name: folderName,
          type: PresetType.builtin, // 폴더는 builtin으로 처리
          path: folderPath, // 실제 path 사용
          chordList: [], // 폴더는 빈 chordList를 가짐
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }).toList();
    } else {
      // 하위 폴더: 현재 경로에 해당하는 프리셋들
      final currentPath = state.folderPath.join('/');
      return state.presets
          .where((preset) => preset.path == currentPath)
          .toList();
    }
  }

  /// 특정 폴더의 프리셋 개수를 반환
  int getPresetCountForFolder(String folderPath) {
    // folderPath는 실제 path (예: "builtin/major_diatonic")
    // 해당 path와 정확히 일치하는 프리셋들을 찾기
    final count =
        state.presets.where((preset) => preset.path == folderPath).length;
    print('getPresetCountForFolder: $folderPath -> $count presets');
    return count;
  }

  /// 프리셋을 적용하여 해당 프리셋의 코드들을 선택 상태로 변경
  ///
  /// [preset] 적용할 프리셋 모델
  void applyPreset(PresetModel preset) {
    for (final chord in preset.chordList) {
      ref.read(chordListProvider.notifier).updateSelection(chord, true);
    }
  }
}
