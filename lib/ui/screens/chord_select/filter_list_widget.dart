import 'package:c2b/providers/filter_list_provider.dart';
import 'package:c2b/ui/screens/chord_select/filter_chip_widget.dart';
import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterListWidget extends ConsumerWidget {
  const FilterListWidget({super.key});

  Widget _filterGroup(
          BuildContext context, String title, List<Widget> children) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          hGap16(),
          Wrap(spacing: 8, runSpacing: 8, children: children),
          hGap16(),
        ],
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterList = ref.watch(filterListProvider);
    // filter group의 종류를 가져옴
    final filterGroups = filterList.map((e) => e.group).toSet().toList();
    print(filterGroups);

    return ListView.separated(
      itemCount: filterGroups.length,
      itemBuilder: (context, index) {
        return _filterGroup(
            context,
            filterGroups[index],
            filterList
                .where((e) => e.group == filterGroups[index])
                .map((item) => FilterChipWidget(
                    label: item.name,
                    isSelected: item.isSelected,
                    onTap: () => ref
                        .read(filterListProvider.notifier)
                        .updateSelection(item.name, !item.isSelected)))
                .toList());
      },
      separatorBuilder: (context, index) => Column(
        children: [
          hGap8(),
          Divider(
            height: 1.0,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          hGap16(),
        ],
      ),
    );
  }
}