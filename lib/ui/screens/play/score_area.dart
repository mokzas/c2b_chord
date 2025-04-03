import 'package:c2b/providers/play_state_provider.dart';
import 'package:c2b/ui/screens/play/bar_widget.dart';
import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 연습 화면에서 악보(chord들의 나열)를 나타내는 영역
///
/// 악보는 여러 개의 bar로 이루어져 있으며, 각 bar는 하나의 chord를 나타냄
class ScoreArea extends ConsumerWidget {
  const ScoreArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentChordIndex = ref.watch(playStateProvider).currentChordIndex;

    final chords = [
      'Bdim',
      'C♯7sus4♭9♭13',
      'Dm7',
      'E♭7sus4♭9♯9',
      'G7sus4',
      'Am6',
      'Cm7',
      'C♯dim7',
    ];

    Widget bars =
        // chords는 8, 4, 2, 1 의 길이만 가져야 한다
        (chords.length == 8)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 4; ++i)
                        BarWidget(
                          chord: chords[i],
                          isActive: currentChordIndex == i,
                        )
                    ],
                  ),
                  hGap16(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 4; i < 8; ++i)
                        BarWidget(
                          chord: chords[i],
                          isActive: currentChordIndex == i,
                        )
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: chords.length == 1
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < chords.length; ++i)
                    BarWidget(
                      chord: chords[i],
                      isActive: currentChordIndex == (i + 1),
                    )
                ],
              );

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(RadiusValue.large),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: bars,
        ),
      ),
    );
  }
}
