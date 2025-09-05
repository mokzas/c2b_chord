import 'package:c2b_chord/providers/play_state_provider.dart';
import 'package:c2b_chord/providers/random_chords_provider.dart';
import 'package:c2b_chord/ui/screens/play/play_control_button_widget.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 재생 컨트롤 영역 위젯
///
/// stop, play/pause, repeat, shuffle 버튼들을 포함하는 컨트롤 패널
class PlayControlArea extends ConsumerWidget {
  const PlayControlArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playState = ref.watch(playStateProvider);

    return Row(
      children: [
        PlayControlButtonWidget(
          icon: Icons.stop_rounded,
          onPressed: () {
            ref.read(playStateProvider.notifier).stop();
          },
        ),
        wGap8(),
        PlayControlButtonWidget(
          icon:
              playState.isPlaying
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
          onPressed: () {
            final controller = ref.read(playStateProvider.notifier);
            if (playState.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          },
        ),
        wGap8(),
        PlayControlButtonWidget(
          icon: Icons.repeat_rounded,
          isActive: playState.isRepeat,
          isEnabled: !playState.isPlaying,
          onPressed: () {
            ref.read(playStateProvider.notifier).toggleRepeat();
          },
        ),
        wGap8(),
        PlayControlButtonWidget(
          icon: Icons.shuffle,
          onPressed: () {
            ref.read(randomChordsProvider.notifier).reGenerate();
          },
        ),
      ],
    );
  }
}
