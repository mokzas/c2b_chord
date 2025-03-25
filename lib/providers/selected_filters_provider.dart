import 'package:c2b/model/filter_list_item_model.dart';
import 'package:c2b/providers/filter_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_filters_provider.g.dart';

@riverpod
List<FilterListItemModel> selectedFilters(Ref ref) {
  final filterList = ref.watch(filterListProvider);
  return filterList.where((item) => item.isSelected).toList();
}
