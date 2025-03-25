import 'package:c2b/model/filter_list_item_model.dart';
import 'package:c2b/util/music.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_list_provider.g.dart';

@riverpod
class FilterList extends _$FilterList {
  @override
  List<FilterListItemModel> build() {
    final List<FilterListItemModel> filterList = [];

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
