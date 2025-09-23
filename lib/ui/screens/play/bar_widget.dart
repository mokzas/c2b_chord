import 'package:c2b_chord/model/chord_model.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// 연습 화면에서 chord 하나를 나타내는 위젯.
///
/// [chord]: chord 이름
///
/// [isActive]: 해당 chord(bar)가 현재 연주중인 여부
///
/// [isShowNoteOn]: 코드 구성음 보여주기 여부
///
/// [chordData]: chord 데이터 (tones 포함, isShowNoteOn이 true일 때만 사용)
///
/// * bar: 악보에서 한 마디를 의미.
class BarWidget extends StatelessWidget {
  final bool isActive;
  final bool isShowNoteOn;
  final ChordModel chord;

  const BarWidget({
    super.key,
    required this.isActive,
    this.isShowNoteOn = false,
    required this.chord,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          // Chord 컨테이너.
          Container(
            height: C2bHeight.bar,
            constraints: BoxConstraints(minWidth: C2bWidth.barMin),
            decoration: BoxDecoration(
              color:
                  isActive
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(C2bRadius.small),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: C2bPadding.small),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chord.name,
                    style: musicTextTheme(context).titleLarge?.copyWith(
                      color:
                          isActive
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : CustomColorScheme.neutral50,
                      fontWeight: isActive ? FontWeight.bold : null,
                    ),
                  ),
                  // Chord 구성음 표시 (isShowNoteOn이 true이고 chordData가 있을 때)
                  if (isShowNoteOn) ...[
                    hGap4(),
                    Text(
                      chord.tones.map((note) => note.str).join(' '),
                      style: musicTextTheme(context).bodySmall
                          ?.copyWith(
                            color:
                                isActive
                                    ? Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryContainer
                                    : CustomColorScheme.neutral50,
                            fontWeight: FontWeight.normal,
                          )
                          .copyWith(
                            color: (isActive
                                    ? Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryContainer
                                    : CustomColorScheme.neutral50)
                                .withOpacity(0.7),
                          ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          hGap4(),
          // Chord 컨테이너 아래 라인.
          Container(
            height: C2bHeight.barLine,
            constraints: BoxConstraints(minWidth: C2bWidth.barMin),
            decoration: BoxDecoration(
              color:
                  isActive
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : CustomColorScheme.neutral50,
              borderRadius: BorderRadius.circular(C2bRadius.full),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: C2bPadding.small),
              // 라인 길이를 Chord 컨테이너와 같게 하기 위한 트릭
              child: Text(
                chord.name,
                style: musicTextTheme(
                  context,
                ).titleLarge?.copyWith(color: Colors.transparent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
