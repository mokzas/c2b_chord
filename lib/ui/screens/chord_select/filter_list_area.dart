import 'package:c2b_chord/providers/filter_map_provider.dart';
import 'package:c2b_chord/ui/screens/chord_select/filter_chip_widget.dart';
import 'package:c2b_chord/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 선택가능한 Filter들을 보여주는 영역
class FilterListArea extends ConsumerWidget {
  const FilterListArea({super.key});

  Widget _filterGroup(
    BuildContext context,
    String title,
    List<Widget> children,
  ) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: Theme.of(context).textTheme.titleSmall),
      hGap16(),
      Wrap(
        spacing: C2bMargin.small,
        runSpacing: C2bMargin.small,
        children: children,
      ),
      hGap16(),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterMap = ref.watch(filterMapProvider);
    // filter group의 종류를 가져옴
    final filterGroups = filterMap.keys.toList();

    return ListView.separated(
      itemCount: filterGroups.length,
      itemBuilder: (context, index) {
        return _filterGroup(
          context,
          filterGroups[index],
          (filterMap[filterGroups[index]] ?? [])
              .map(
                (item) => FilterChipWidget(
                  label: item.name,
                  isSelected: item.isSelected,
                  onTap:
                      () => ref
                          .read(filterMapProvider.notifier)
                          .updateSelection(item.name, !item.isSelected),
                ),
              )
              .toList(),
        );
      },
      separatorBuilder:
          (context, index) =>
              filterGroups[index] != '7th'
                  ? Column(
                    children: [
                      hGap8(),
                      Divider(
                        height: C2bHeight.divider,
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                      hGap16(),
                    ],
                  )
                  : Container(),
    );
  }
}
