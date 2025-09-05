import 'package:c2b_chord/providers/chord_list_provider.dart';
import 'package:c2b_chord/providers/selected_chords_provider.dart';
import 'package:c2b_chord/routing/routes.dart';
import 'package:c2b_chord/ui/screens/chord_select/selected_chords_area.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:c2b_chord/ui/widgets/outlined_button_small.dart';
import 'package:c2b_chord/ui/widgets/primary_button_small.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 선택된 Chord들을 보여주는 영역
class SelectedChordsAreaContainer extends ConsumerWidget {
  const SelectedChordsAreaContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChords = ref.watch(selectedChordsProvider);

    return Container(
      width: 260.0,
      padding: EdgeInsets.only(left: C2bPadding.largeContainer),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* 타이틀 'Selected (<선택된 Chord 개수>)' */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected (${selectedChords.length})',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  hGap4(),
                  Container(
                    width: 36.0,
                    height: C2bHeight.divider,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ],
              ),
              /* 프리셋 저장 버튼 */
              // Icon(
              //   Icons.bookmark_add,
              //   color: Theme.of(context).colorScheme.primary,
              // ),
            ],
          ),
          hGap16(),
          Expanded(child: SelectedChordsArea()),
          hGap16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Clear 버튼
              OutlinedButtonSmall(
                text: 'Clear',
                onPressed:
                    () => ref
                        .read(chordListProvider.notifier)
                        .updateSelectionAll(false),
              ),
              // Start 버튼
              PrimaryButtonSmall(
                text: 'Start',
                onPressed:
                    selectedChords.isEmpty
                        ? () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: Text('No Chords Selected'),
                                  content: Text(
                                    'Please select at least one chord to proceed to the Play screen.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed:
                                          () => Navigator.of(context).pop(),
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                          );
                        }
                        : () => context.push(Routes.play),
                isEnabled: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
