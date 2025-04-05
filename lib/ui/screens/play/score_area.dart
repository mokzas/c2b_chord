import 'package:c2b/providers/play_state_provider.dart';
import 'package:c2b/providers/random_chords_provider.dart';
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
    final displayChordCount = ref.watch(playStateProvider).displayChordCount;
    final randomChords = ref.watch(randomChordsProvider);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(RadiusValue.large),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: GridMargin.longSide),
          child: (randomChords.isEmpty)
              ? Expanded(child: Center(child: Text('No chords selected.')))
              : (displayChordCount == 8)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 4; ++i)
                              BarWidget(
                                chord: randomChords[i],
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
                                chord: randomChords[i],
                                isActive: currentChordIndex == i,
                              )
                          ],
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: displayChordCount == 1
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < displayChordCount; ++i)
                          BarWidget(
                            chord: randomChords[i],
                            isActive: currentChordIndex == (i),
                          )
                      ],
                    ),
        ),
      ),
    );
  }
}
