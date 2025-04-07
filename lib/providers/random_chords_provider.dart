import 'dart:math' as math;

import 'package:c2b/providers/play_state_provider.dart';
import 'package:c2b/providers/selected_chords_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_chords_provider.g.dart';

/// 선택된 코드 중 랜덤으로 chord를 뽑아 반환하는 Provider
///
/// 화면에 표시할 chord 수만큼 뽑아서 반환
@riverpod
class RandomChords extends _$RandomChords {
  @override
  List<String> build() {
    final selectedChords = ref.watch(selectedChordsProvider);
    if (selectedChords.isEmpty) return [];

    final displayChordCount = ref.read(playStateProvider).displayChordCount;
    final random = math.Random();
    final randomChords = <String>[];

    for (int i = 0; i < displayChordCount; i++) {
      final index = random.nextInt(selectedChords.length);
      randomChords.add(selectedChords[index].name);
    }

    return randomChords;
  }

  /// 화면에 표시되는 chord 수만큼의 랜덤 chord를 반환하는 함수
  void reGenerate() {
    state = build();
  }

  /// [playStateProvider.reGenerateCount]만큼의 새로운 랜덤 chord를 생성하는 함수.
  /// 현재 악보가 [playStateProvider.reGenerateCount]번째 chord까지 연주되었을 때,
  /// 아직 연주되지 않은 chord들을 앞으로 당기고, 연주된 chord 수만큼 새로운 랜덤
  /// Chord 생성
  void reGeneratePart() {
    final selectedChords = ref.watch(selectedChordsProvider);
    if (selectedChords.isEmpty) return;

    final displayChordCount = ref.read(playStateProvider).displayChordCount;
    final reGenerateCount = ref.read(playStateProvider).reGenerateCount;
    final random = math.Random();
    final randomChords = <String>[];

    for (int i = reGenerateCount; i < displayChordCount; i++) {
      randomChords.add(state[i]);
    }
    for (int i = 0; i < reGenerateCount; i++) {
      final index = random.nextInt(selectedChords.length);
      randomChords.add(selectedChords[index].name);
    }

    state = randomChords;
  }
}
