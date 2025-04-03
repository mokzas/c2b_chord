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

  void reGenerate() {
    state = build();
  }
}
