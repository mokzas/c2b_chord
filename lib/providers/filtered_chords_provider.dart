import 'package:c2b/model/chord_list_item_model.dart';
import 'package:c2b/model/filter_list_item_model.dart';
import 'package:c2b/providers/chord_list_provider.dart';
import 'package:c2b/providers/filter_map_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_chords_provider.g.dart';

/// 유저가 선택한 필터 조건에 맞는 코드들의 리스트를 반환하는 Provider
@riverpod
List<ChordListItemModel> filteredChords(Ref ref) {
  final chordList = ref.watch(chordListProvider).value;
  final Map<String, List<FilterListItemModel>> filterMap =
      ref.watch(filterMapProvider);

  if (chordList == null) return [];

  // Group filters by category
  final selectedRoots = filterMap['Root']
          ?.where((e) => e.isSelected == true)
          .map((e) => e.name)
          .toList() ??
      [];

  final selectedTriads =
      filterMap['Triad']?.where((e) => e.isSelected == true).toList() ?? [];

  final selectedSevenths =
      filterMap['7th']?.where((e) => e.isSelected == true).toList() ?? [];

  // extension filter 적용시 사용.
  final extensionBase =
      selectedSevenths.isEmpty ? (filterMap['7th'] ?? []) : selectedSevenths;
  assert(extensionBase.isNotEmpty);

  final selectedExtensions =
      filterMap['Extension']?.where((e) => e.isSelected == true).toList() ?? [];

  final selectedAlters =
      (filterMap['Alter, add']?.where((e) => e.isSelected == true) ?? [])
          .map((e) => e.name);
  final allAlters = filterMap['Alter, add'] ?? [];
  assert(allAlters.isNotEmpty);

  final isSelectedFilterEmpty = selectedTriads.isEmpty &&
      selectedSevenths.isEmpty &&
      selectedExtensions.isEmpty &&
      selectedAlters.isEmpty;

  // Step 1: Match root
  // 선택된 Root를 갖는 모든 chord를 필터링
  // 선택된 Root filter가 없는 경우 모든 root의 chord를 보여주도록 함.
  final step1 = selectedRoots.isEmpty
      ? chordList
      : chordList.where((e) {
          return selectedRoots.contains(e.chord.root.str);
        });

  // 1. Root 포함 모든 그룹에서 선택된 필터가 없는 경우: 모든 코드를 보여줌
  // 2. Root 그룹에는 선택한 filter가 있는데, 나머지 그룹에서 선택한 filter가
  //    없으면 선택한 root의 모든 chord를 보여주도록 함.
  if (isSelectedFilterEmpty) return step1.toList();

  // Step 2: Exact match of root + triad
  // <선택된 root> x <선택된 triad>와 정확히 일치하는 항목
  final step2 = step1.where((e) {
    final chordName = e.chord.name;
    final root = e.chord.root.str;
    return selectedTriads
        .any((triadFilter) => chordName == '$root${triadFilter.name}');
  });

  // Step 3: Match any 7th or extension
  final extensionPattern = RegExp(r'^(m?|M?)?(6|7|9|11|13)');
  final step3 = step1.where((e) {
    final chordName = e.chord.name;
    final match7th = selectedSevenths.any((seventhFilter) {
      // '7'의 경우 'M7', 'm7' 등에 모두 포함되기 때문에 '포함하는가'가 아닌
      // '시작하는가'로 검사해야함. 'M7'은 'augM7', 'mM7', 'm7'은 dim7 등에
      // 대하여 동일함
      if (extensionPattern.hasMatch(seventhFilter.name)) {
        final quality = chordName.replaceFirst(e.chord.root.str, '');
        return quality.startsWith(seventhFilter.name);
      }
      return chordName.contains(seventhFilter.name);
    });

    // extension matching
    // 7th 그룹에서 선택된 filter가 없을 경우, 모든 7th 필터에 대하여 다음을 수행
    final matchExtension = extensionBase.expand((s7Filter) {
      return selectedExtensions
          .map((extFilter) => s7Filter.name.replaceAll('7', extFilter.name));
    }).any((extS7Filter) {
      // 7th와 동일.
      if (extensionPattern.hasMatch(extS7Filter)) {
        final quality = chordName.replaceFirst(e.chord.root.str, '');
        return quality.startsWith(extS7Filter);
      }
      return chordName.contains(extS7Filter);
    });

    return match7th || matchExtension;
  });

  // step2, step3 양쪽 모두에 포함되는 chord는 없어야 한다
  assert(!(step3.any(
      (c) => step2.map((c) => c.chord.name).toSet().contains(c.chord.name))));

  // Step 4
  final List<ChordListItemModel> step4 = [...step2, ...step3];

  // Step 5: Whitelist filtering for Alter, add
  // step4 중 allAlters를 한개도 포함하지 않으면 살려줌. 포함하는 경우,
  // selectedAlters에 포함된 필터이면 살려줌. 7th, Extension 모두에서 선택된
  // 필터가 없는 경우, selectedAlters 중 하나라도 포함하는 놈은 살려줌.
  final step5 = selectedSevenths.isEmpty && selectedExtensions.isEmpty
      ? [
          ...step2,
          ...(step1.where((item) {
            final name = item.chord.name;
            return selectedAlters.any((alt) => name.contains(alt));
          }).toList())
        ]
      : step4.where((item) {
          final chordName = item.chord.name;
          return allAlters.every((alter) {
            if (chordName.contains(alter.name)) {
              return selectedAlters.contains(alter.name);
            }
            return true;
          });
        }).toList();

  // Root 이외 그룹에서 선택한 filter가 하나라도 있으면 step5를 보여줌.
  return step5;
}
