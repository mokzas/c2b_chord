import 'package:c2b_chord/model/filter_list_item_model.dart';
import 'package:c2b_chord/util/music.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_map_provider.g.dart';

/// 선택가능한 모든 Filter의 데이터를 그룹별로 관리하는 Provider
@riverpod
class FilterMap extends _$FilterMap {
  @override
  Map<String, List<FilterListItemModel>> build() {
    final Map<String, List<FilterListItemModel>> filterMap = {};

    // filter 그룹 중 Root 그룹만 music.dart의 rootNotes 정보를 사용
    final List<FilterListItemModel> rootFilters = [];
    for (final note in rootNotes) {
      rootFilters.add(
        FilterListItemModel(name: note.str, group: 'Root', isSelected: false),
      );
    }
    filterMap['Root'] = rootFilters;

    // 나머지 그룹은 모두 quality를 나타내는 filter. qualityFilters에서 읽어옴
    for (final group in _qualityFilters.keys) {
      if (_qualityFilters[group] == null) continue;

      // group별로 포함된 filter들을 읽어오기
      final List<FilterListItemModel> filters = [];
      for (final filter in _qualityFilters[group]!) {
        if (filter['name'] == null) continue;
        filters.add(
          FilterListItemModel(
            name: filter['name']!,
            group: filter['group']?.toString() ?? 'null',
            isSelected: false,
          ),
        );
      }

      filterMap.putIfAbsent(group, () => filters);
    }

    return filterMap;
  }

  /// 이름이 [name]인 FilterLitsItem의 선택 여부를 파라미터 [isSelected]로
  /// 업데이트하는 함수
  void updateSelection(String name, bool isSelected) {
    final updatedMap = <String, List<FilterListItemModel>>{};

    // 각 그룹의 item들을 업데이트
    for (final entry in state.entries) {
      final group = entry.key;
      final itemList = entry.value;

      final updatedList =
          itemList.map((item) {
            if (item.name == name) {
              return item.copyWith(isSelected: isSelected);
            } else {
              return item;
            }
          }).toList();

      updatedMap[group] = updatedList;
    }

    state = updatedMap;
  }
}

/// chord 선택 화면의 filter로 사용될 quality의 리스트
///
/// **아래 나열된 filter 그룹의 순서를 유지할 것**
///
/// https://api.flutter.dev/flutter/dart-collection/LinkedHashMap-class.html
const Map<String, List<Map<String, String>>> _qualityFilters = {
  'Triad': [
    {'name': 'M', 'group': 'Triad'},
    {'name': 'm', 'group': 'Triad'},
    {'name': 'dim', 'group': 'Triad'},
    {'name': 'aug', 'group': 'Triad'},
    {'name': 'sus2', 'group': 'Triad'},
    {'name': 'sus4', 'group': 'Triad'},
    {'name': 'quartal', 'group': 'Triad'},
  ],
  '7th': [
    {'name': 'M7', 'group': '7th'},
    {'name': 'm7', 'group': '7th'},
    {'name': '7', 'group': '7th'},
    {'name': 'dim7', 'group': '7th'},
    {'name': 'aug7', 'group': '7th'},
    {'name': '7sus2', 'group': '7th'},
    {'name': '7sus4', 'group': '7th'},
    {'name': 'M7sus2', 'group': '7th'},
    {'name': 'M7sus4', 'group': '7th'},
    {'name': 'ø7', 'group': '7th'},
    {'name': 'mM7', 'group': '7th'},
    {'name': 'augM7', 'group': '7th'},
  ],
  'Extension': [
    {'name': '6', 'group': 'Extension'},
    {'name': '9', 'group': 'Extension'},
    {'name': '11', 'group': 'Extension'},
    {'name': '13', 'group': 'Extension'},
  ],
  'Alter, add': [
    {'name': '♭5', 'group': 'Alter, add'},
    {'name': '♯5', 'group': 'Alter, add'},
    {'name': '♭9', 'group': 'Alter, add'},
    {'name': '♯9', 'group': 'Alter, add'},
    {'name': '♯11', 'group': 'Alter, add'},
    {'name': '♭13', 'group': 'Alter, add'},
    {'name': 'alt', 'group': 'Alter, add'},
    {'name': 'add2', 'group': 'Alter, add'},
    {'name': 'add9', 'group': 'Alter, add'},
    {'name': 'add11', 'group': 'Alter, add'},
    {'name': 'add13', 'group': 'Alter, add'},
  ],
};
