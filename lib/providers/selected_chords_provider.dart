import 'package:c2b/model/chord_model.dart';
import 'package:c2b/providers/chord_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_chords_provider.g.dart';

/// 전체 Chord 중 선택된 Chord만을 반환하는 Provider
@riverpod
List<ChordModel> selectedChords(Ref ref) {
  final chordList = ref.watch(chordListProvider).value;
  if (chordList == null) return [];

  return chordList
      .where((item) => item.isSelected)
      .map((item) => item.chord)
      .toList();
}
