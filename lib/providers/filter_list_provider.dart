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
    for (final property in qualityProperties) {
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
