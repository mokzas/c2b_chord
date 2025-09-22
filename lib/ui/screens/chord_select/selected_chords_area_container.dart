import 'package:c2b_chord/model/chord_model.dart';
import 'package:c2b_chord/providers/chord_list_provider.dart';
import 'package:c2b_chord/providers/preset_state_provider.dart';
import 'package:c2b_chord/providers/selected_chords_provider.dart';
import 'package:c2b_chord/routing/routes.dart';
import 'package:c2b_chord/ui/screens/chord_select/modal_bottom_sheet.dart';
import 'package:c2b_chord/ui/screens/chord_select/selected_chords_area.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:c2b_chord/ui/widgets/outlined_button_small.dart';
import 'package:c2b_chord/ui/widgets/primary_button_small.dart';
import 'package:c2b_chord/util/show_result_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 선택된 Chord들을 보여주는 영역
class SelectedChordsAreaContainer extends ConsumerStatefulWidget {
  const SelectedChordsAreaContainer({super.key});

  @override
  ConsumerState<SelectedChordsAreaContainer> createState() =>
      _SelectedChordsAreaContainerState();
}

class _SelectedChordsAreaContainerState
    extends ConsumerState<SelectedChordsAreaContainer> {
  @override
  Widget build(BuildContext context) {
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
              IconButton(
                onPressed:
                    selectedChords.isEmpty
                        ? null
                        : () {
                          ModalBottomSheet.show(
                            context: context,
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                final controller = TextEditingController();
                                return Row(
                                  children: [
                                    /* 프리셋 이름 입력 필드 */
                                    Expanded(
                                      child: TextField(
                                        controller: controller,
                                        decoration: InputDecoration(
                                          labelText: 'Preset Name',
                                          hintText: 'e.g., My Jazz Chords',
                                          border: OutlineInputBorder(),
                                        ),
                                        autofocus: true,
                                        onSubmitted: (value) {
                                          if (value.trim().isNotEmpty) {
                                            _savePreset(
                                              context,
                                              value.trim(),
                                              selectedChords,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    wGap8(),
                                    /* Save 버튼 */
                                    TextButton(
                                      onPressed: () {
                                        if (controller.text.trim().isNotEmpty) {
                                          _savePreset(
                                            context,
                                            controller.text.trim(),
                                            selectedChords,
                                          );
                                        }
                                      },
                                      child: Text('Save'),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                icon: Icon(
                  Icons.bookmark_add,
                  color:
                      selectedChords.isEmpty
                          ? Theme.of(context).colorScheme.outline
                          : Theme.of(context).colorScheme.primary,
                ),
              ),
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

  /// 프리셋 저장
  Future<void> _savePreset(
    BuildContext context,
    String name,
    List<ChordModel> selectedChords,
  ) async {
    await ShowResultSnackBar.showResult(
      context,
      () => ref
          .read(presetStateProvider.notifier)
          .saveUserPreset(name: name, chordList: selectedChords),
      successMessage: 'Preset "$name" saved successfully!',
      failureMessage: 'Failed to save preset',
      onSuccess: () => Navigator.pop(context),
    );
  }
}
