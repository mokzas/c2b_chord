import 'package:c2b_chord/providers/filter_map_provider.dart';
import 'package:c2b_chord/ui/screens/chord_select/filter_chip_widget.dart';
import 'package:c2b_chord/ui/screens/chord_select/filter_list_area.dart';
import 'package:c2b_chord/ui/screens/chord_select/modal_side_sheet.dart';
import 'package:c2b_chord/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 선택된 필터들을 보여주는 영역
class SelectedFiltersHorizontalArea extends ConsumerWidget {
  const SelectedFiltersHorizontalArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters =
        ref
            .watch(filterMapProvider)
            .values
            .expand((itemList) => itemList)
            .where((item) => item.isSelected)
            .toList();

    return Row(
      children: [
        Container(
          width: C2bWidth.filterChipMin,
          height: C2bHeight.filterChipMin,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(C2bRadius.full),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:
                  () => ModalSideSheet.show(
                    context: context,
                    title: 'Filters',
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: C2bPadding.shortSide,
                        right: C2bPadding.longSide,
                      ),
                      child: FilterListArea(),
                    ),
                  ),
              borderRadius: BorderRadius.circular(C2bRadius.full),
              child: Icon(Icons.filter_list),
            ),
          ),
        ),
        wGap4(),
        Expanded(
          child: SizedBox(
            height: C2bHeight.filterChipMin,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = selectedFilters.elementAt(index);
                return FilterChipWidget(
                  label: filter.name,
                  isSelected: filter.isSelected,
                  onTap:
                      () => ref
                          .read(filterMapProvider.notifier)
                          .updateSelection(filter.name, !filter.isSelected),
                );
              },
              separatorBuilder: (_, __) => wGap8(),
              itemCount: selectedFilters.length,
            ),
          ),
        ),
      ],
    );
  }
}
