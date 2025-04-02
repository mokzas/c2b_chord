import 'package:c2b/model/chord_list_item_model.dart';
import 'package:c2b/providers/chord_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_chords_provider.g.dart';

/// 유저가 선택한 필터 조건에 맞는 코드들의 리스트를 반환하는 Provider
@riverpod
List<ChordListItemModel> filteredChords(Ref ref) {
  final chordList = ref.watch(chordListProvider).value;
  if (chordList == null) return [];

  final filteredChords = ref
      .read(chordListProvider.notifier)
      .getFilteredChords(chordList);

  return filteredChords;
}
