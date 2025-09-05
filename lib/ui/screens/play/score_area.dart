import 'package:c2b_chord/providers/play_state_provider.dart';
import 'package:c2b_chord/providers/random_chords_provider.dart';
import 'package:c2b_chord/ui/screens/play/bar_widget.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 연습 화면에서 악보(chord들의 나열)를 나타내는 영역
///
/// 악보는 여러 개의 bar로 이루어져 있으며, 각 bar는 하나의 chord를 나타냄
class ScoreArea extends ConsumerWidget {
  const ScoreArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playState = ref.watch(playStateProvider);
    final currentChordIndex = playState.currentChordIndex;
    final displayChordCount = playState.displayChordCount;
    final reGenerateCount = playState.reGenerateCount;
    final isRepeat = playState.isRepeat;

    final randomChords = ref.watch(randomChordsProvider);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(C2bRadius.large),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: C2bPadding.longSide),
          child:
              (randomChords.isEmpty)
                  ? Expanded(child: Center(child: Text('No chords selected.')))
                  : (displayChordCount == 8)
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /* 윗줄 chord 4개 */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < 4; ++i)
                            BarWidget(
                              chord: randomChords[i],
                              isActive:
                                  isRepeat
                                      ? currentChordIndex == i
                                      : currentChordIndex % reGenerateCount ==
                                          i,
                            ),
                        ],
                      ),
                      hGap16(),
                      /* 아랫줄 chord 4개 */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 4; i < 8; ++i)
                            Opacity(
                              opacity: isRepeat ? 1.0 : 0.5,
                              child: BarWidget(
                                chord: randomChords[i],
                                isActive:
                                    isRepeat
                                        ? currentChordIndex == i
                                        : currentChordIndex % reGenerateCount ==
                                            i,
                              ),
                            ),
                        ],
                      ),
                    ],
                  )
                  : Row(
                    mainAxisAlignment:
                        displayChordCount == 1
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < displayChordCount; ++i)
                        BarWidget(
                          chord: randomChords[i],
                          isActive:
                              isRepeat
                                  ? currentChordIndex == i
                                  : currentChordIndex % reGenerateCount == i,
                        ),
                    ],
                  ),
        ),
      ),
    );
  }
}
