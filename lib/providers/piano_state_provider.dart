import 'package:c2b_chord/model/piano_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 피아노 상태를 관리하는 Provider
final pianoStateProvider =
    StateNotifierProvider<PianoStateNotifier, PianoStateModel>(
      (ref) => PianoStateNotifier(),
    );

class PianoStateNotifier extends StateNotifier<PianoStateModel> {
  PianoStateNotifier() : super(const PianoStateModel());

  /// 특정 건반을 눌렀다/떼었다 토글
  void toggleKey(int midiNumber) {
    final newPressedKeys = Set<int>.from(state.pressedKeys);

    if (newPressedKeys.contains(midiNumber)) {
      newPressedKeys.remove(midiNumber);
    } else {
      newPressedKeys.add(midiNumber);
    }

    state = state.copyWith(pressedKeys: newPressedKeys);
  }

  /// 모든 건반을 해제
  void clearAllKeys() {
    state = state.copyWith(pressedKeys: {});
  }

  /// 특정 건반을 눌림 상태로 설정
  void pressKey(int midiNumber) {
    final newPressedKeys = Set<int>.from(state.pressedKeys);
    newPressedKeys.add(midiNumber);
    state = state.copyWith(pressedKeys: newPressedKeys);
  }

  /// 특정 건반을 해제
  void releaseKey(int midiNumber) {
    final newPressedKeys = Set<int>.from(state.pressedKeys);
    newPressedKeys.remove(midiNumber);
    state = state.copyWith(pressedKeys: newPressedKeys);
  }
}
