import 'package:c2b/model/filter_list_item_model.dart';
import 'package:c2b/util/music.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_list_provider.g.dart';

/// 선택가능한 모든 Filter 리스트의 데이터를 관리하는 Provider
@riverpod
class FilterList extends _$FilterList {
  @override
  List<FilterListItemModel> build() {
    final List<FilterListItemModel> filterList = [];

    // filter 그룹 중 Root 그룹만 music.dart의 rootNotes 정보를 사용
    // 나머지 그룹은 모두 quality를 나타내는 filter. qualityProperties 사용.
    for (final note in rootNotes) {
      filterList.add(
        FilterListItemModel(
          name: note.str,
          group: "Root",
          isSelected: false,
        ),
      );
    }
    for (final property in _qualityFilters) {
      if (property['name'] == null) continue;

      filterList.add(
        FilterListItemModel(
          name: property['name']!,
          group: property['group']?.toString() ?? "null",
          isSelected: false,
        ),
      );
    }

    return filterList;
  }

  // 각 FilterLitsItem의 선택 여부를 업데이트하는 함수
  void updateSelection(String name, bool isSelected) {
    final current = state;

    final updatedList = current.map((e) {
      if (e.name == name) {
        return e.copyWith(isSelected: isSelected);
      } else {
        return e;
      }
    }).toList();

    state = updatedList;
  }
}

/// chord 선택 화면의 filter로 사용될 quality의 리스트
const List<Map<String, String>> _qualityFilters = [
  {"name": "M", "group": "Triad"},
  {"name": "m", "group": "Triad"},
  {"name": "dim", "group": "Triad"},
  {"name": "aug", "group": "Triad"},
  {"name": "sus2", "group": "Triad"},
  {"name": "sus4", "group": "Triad"},
  {"name": "Quartal", "group": "Triad"},
  {"name": "M7", "group": "7th"},
  {"name": "m7", "group": "7th"},
  {"name": "7", "group": "7th"},
  {"name": "dim7", "group": "7th"},
  {"name": "aug7", "group": "7th"},
  {"name": "7sus2", "group": "7th"},
  {"name": "7sus4", "group": "7th"},
  {"name": "M7sus2", "group": "7th"},
  {"name": "M7sus4", "group": "7th"},
  {"name": "ø7", "group": "7th"},
  {"name": "mM7", "group": "7th"},
  {"name": "augM7", "group": "7th"},
  {"name": "6", "group": "Extension"},
  {"name": "9", "group": "Extension"},
  {"name": "11", "group": "Extension"},
  {"name": "13", "group": "Extension"},
  {"name": "♭5", "group": "Alter, add"},
  {"name": "♯5", "group": "Alter, add"},
  {"name": "♭9", "group": "Alter, add"},
  {"name": "♯9", "group": "Alter, add"},
  {"name": "♯11", "group": "Alter, add"},
  {"name": "♭13", "group": "Alter, add"},
  {"name": "alt", "group": "Alter, add"},
  {"name": "add2", "group": "Alter, add"},
  {"name": "add9", "group": "Alter, add"},
  {"name": "add11", "group": "Alter, add"},
  {"name": "add13", "group": "Alter, add"},
];