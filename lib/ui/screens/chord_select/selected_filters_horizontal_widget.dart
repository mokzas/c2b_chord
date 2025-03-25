import 'package:c2b/providers/filter_list_provider.dart';
import 'package:c2b/providers/selected_filters_provider.dart';
import 'package:c2b/ui/screens/chord_select/filter_chip_widget.dart';
import 'package:c2b/ui/screens/chord_select/filter_list_widget.dart';
import 'package:c2b/ui/screens/chord_select/modal_side_sheet.dart';
import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedFiltersHorizontalWidget extends ConsumerWidget {
  const SelectedFiltersHorizontalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(selectedFiltersProvider);
    return Row(
      children: [
        Container(
          width: 44.0,
          height: 28.0,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(RadiusValue.full),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => ModalSideSheet.show(
                context: context,
                title: 'Filters',
                child: Padding(
                  padding: EdgeInsets.only(
                      left: GridMargin.shortSide, right: GridMargin.longSide),
                  child: FilterListWidget(),
                ),
              ),
              borderRadius: BorderRadius.circular(RadiusValue.full),
              child: Icon(Icons.filter_list),
            ),
          ),
        ),
        wGap4(),
        Expanded(
          child: SizedBox(
            height: 28.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = selectedFilters.elementAt(index);
                return FilterChipWidget(
                    label: filter.name,
                    isSelected: filter.isSelected,
                    onTap: () => ref
                        .read(filterListProvider.notifier)
                        .updateSelection(filter.name, !filter.isSelected));
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
