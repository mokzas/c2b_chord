import 'package:c2b_chord/providers/chord_list_provider.dart';
import 'package:c2b_chord/ui/screens/chord_select/chord_list_area.dart';
import 'package:c2b_chord/ui/screens/chord_select/selected_filters_horizontal_area.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 코드 선택 탭 영역
class ChordSelectTabArea extends ConsumerStatefulWidget {
  const ChordSelectTabArea({super.key});

  @override
  ConsumerState<ChordSelectTabArea> createState() => _ChordSelectTabAreaState();
}

class _ChordSelectTabAreaState extends ConsumerState<ChordSelectTabArea> {
  @override
  Widget build(BuildContext context) {
    final chordListAsync = ref.watch(chordListProvider);

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: C2bPadding.largeContainer),
        child: Column(
          children: [
            /* 선택된 필터 보여주는 section */
            SelectedFiltersHorizontalArea(),
            /* 타이틀 "Chords" */
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: C2bPadding.listTitleHorizontal,
              ),
              title: Text(
                'Chords',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              /* chord 전체 선택 체크박스 */
              trailing: chordListAsync.when(
                data: (chordList) {
                  final filteredChords = ref
                      .read(chordListProvider.notifier)
                      .getFilteredChords(chordList);

                  // 현재 filtered 되어 보여지고 있는 chordlistitem들의 체크박스 상태 계산
                  final selectedCount =
                      filteredChords.where((item) => item.isSelected).length;
                  final totalCount = filteredChords.length;

                  bool? checkBoxValue;
                  if (selectedCount == 0) {
                    checkBoxValue = false; // 모두 미선택
                  } else if (selectedCount == totalCount) {
                    checkBoxValue = true; // 모두 선택
                  } else {
                    checkBoxValue = null; // 일부 선택 (tri-state)
                  }

                  return Checkbox(
                    value: checkBoxValue,
                    tristate: true,
                    onChanged: (value) {
                      if (value == true) {
                        // unchecked 상태에서 클릭 → 전체 체크
                        ref
                            .read(chordListProvider.notifier)
                            .updateFilteredSelectionAll(true);
                      } else {
                        // checked 또는 tri-state에서 클릭 → 전체 uncheck
                        ref
                            .read(chordListProvider.notifier)
                            .updateFilteredSelectionAll(false);
                      }
                    },
                  );
                },
                loading:
                    () =>
                        Checkbox(value: false, tristate: true, onChanged: null),
                error:
                    (_, __) =>
                        Checkbox(value: false, tristate: true, onChanged: null),
              ),
            ),
            Divider(height: C2bHeight.divider),
            /* 선택 가능한 Chord 리스트 */
            Expanded(child: ChordListArea()),
          ],
        ),
      ),
    );
  }
}
