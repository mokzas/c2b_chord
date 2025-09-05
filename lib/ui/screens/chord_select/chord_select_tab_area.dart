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
  bool _topCheckBoxState = false;

  @override
  Widget build(BuildContext context) {
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
              trailing: Checkbox(
                value: _topCheckBoxState,
                onChanged: (value) {
                  setState(() {
                    _topCheckBoxState = value ?? false;
                  });

                  ref
                      .read(chordListProvider.notifier)
                      .updateFilteredSelectionAll(_topCheckBoxState);
                },
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
