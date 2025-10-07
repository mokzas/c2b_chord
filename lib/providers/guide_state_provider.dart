import 'package:c2b_chord/model/guide_state_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'guide_state_provider.g.dart';

/// 사용자 가이드 상태를 관리하는 Provider
@riverpod
class GuideState extends _$GuideState {
  static const String _playScreenGuideDontShowKey =
      'play_screen_guide_dont_show';
  static const String _quizModeGuideDontShowKey = 'quiz_mode_guide_dont_show';

  @override
  Future<GuideStateModel> build() async {
    final prefs = await SharedPreferences.getInstance();

    return GuideStateModel(
      showPlayScreenGuide:
          !(prefs.getBool(_playScreenGuideDontShowKey) ?? false),
      showQuizModeGuide: false, // Quiz Mode Guide는 항상 false로 시작
    );
  }

  /// Play 화면 가이드 임시로 숨기기 (Next 버튼)
  Future<void> hidePlayScreenGuide() async {
    final currentState = await future;
    state = AsyncData(currentState.copyWith(showPlayScreenGuide: false));
  }

  /// Play 화면 가이드 다시 보지 않기 (Don't show again 버튼)
  Future<void> dontShowPlayScreenGuideAgain() async {
    await _setDontShowAgain(_playScreenGuideDontShowKey);
    final currentState = await future;
    state = AsyncData(currentState.copyWith(showPlayScreenGuide: false));
  }

  /// Quiz 모드 가이드 표시 (Quiz 모드 진입 시)
  Future<void> showQuizModeGuide() async {
    final prefs = await SharedPreferences.getInstance();
    final dontShow = prefs.getBool(_quizModeGuideDontShowKey) ?? false;

    if (!dontShow) {
      final currentState = await future;
      state = AsyncData(currentState.copyWith(showQuizModeGuide: true));
    }
  }

  /// Quiz 모드 가이드 임시로 숨기기 (Start 버튼)
  Future<void> hideQuizModeGuide() async {
    final currentState = await future;
    state = AsyncData(currentState.copyWith(showQuizModeGuide: false));
  }

  /// Quiz 모드 가이드 다시 보지 않기 (Don't show again 버튼)
  Future<void> dontShowQuizModeGuideAgain() async {
    await _setDontShowAgain(_quizModeGuideDontShowKey);
    final currentState = await future;
    state = AsyncData(currentState.copyWith(showQuizModeGuide: false));
  }

  /// SharedPreferences에 "다시 보지 않기" 저장 (내부 헬퍼 메서드)
  Future<void> _setDontShowAgain(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, true);
  }
}
