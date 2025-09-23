import 'package:c2b_chord/providers/play_state_provider.dart';
import 'package:c2b_chord/ui/screens/play/quiz_control_button_widget.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 재생 컨트롤 영역 위젯
///
/// stop, play/pause, repeat, shuffle 버튼들을 포함하는 컨트롤 패널
class QuizControlArea extends ConsumerWidget {
  const QuizControlArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playState = ref.watch(playStateProvider);

    return Row(
      children: [
        QuizControlButtonWidget(
          icon: Icons.abc,
          isActive: playState.isShowNoteOn,
          onPressed: () {
            ref.read(playStateProvider.notifier).toggleShowNote();
          },
        ),
        wGap4(),
        QuizControlButtonWidget(
          icon: Icons.piano,
          isActive: playState.isPianoQuizOn,
          isEnabled: !playState.isPlaying,
          onPressed: () {
            ref.read(playStateProvider.notifier).togglePianoQuiz();
          },
        ),
      ],
    );
  }
}
