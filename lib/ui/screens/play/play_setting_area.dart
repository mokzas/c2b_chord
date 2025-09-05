import 'package:c2b_chord/providers/play_state_provider.dart';
import 'package:c2b_chord/ui/screens/play/play_setting_widget.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Beat, BPM, ChordCount를 설정하는 섹션
///
/// Beat: chord 하나당 메트로놈 tick수. metronome의 timeSignature값.
///
/// BPM: 메트로놈 속도 (Beats Per Minute)
///
/// ChordCount: 화면에 보여줄 chord 개수
class PlaySettingArea extends ConsumerWidget {
  const PlaySettingArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playState = ref.watch(playStateProvider);

    return Row(
      children: [
        /* Beat 수 */
        PlaySettingWidget(
          title: 'Beat',
          value: playState.timeSignature,
          dialogTitle: 'Select Beats',
          minValue: 2,
          maxValue: 8,
          onValueChanged: (value) {
            ref.read(playStateProvider.notifier).setTimeSignature(value);
          },
        ),
        wGap8(),
        /* BPM */
        PlaySettingWidget(
          title: 'BPM',
          value: playState.bpm,
          dialogTitle: 'Select BPM',
          minValue: 40,
          maxValue: 600,
          onValueChanged: (value) {
            ref.read(playStateProvider.notifier).setBPM(value);
          },
        ),
        wGap8(),
        /* 화면에 보여줄 chord 개수 */
        PlaySettingWidget(
          title: 'Chords',
          value: playState.displayChordCount,
          dialogTitle: 'Select Chords',
          minValue: 1,
          maxValue: 8,
          values: const [1, 2, 8],
          onValueChanged: (value) {
            ref.read(playStateProvider.notifier).setDisplayChordCount(value);
          },
        ),
      ],
    );
  }
}
