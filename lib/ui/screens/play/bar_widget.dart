import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// 연습 화면에서 chord 하나를 나타내는 위젯.
///
/// [chord]: chord 이름
///
/// [isActive]: 해당 chord(bar)가 현재 연주중인 여부
///
/// * bar: 악보에서 한 마디를 의미.
class BarWidget extends StatelessWidget {
  final String chord;
  final bool isActive;

  const BarWidget({super.key, required this.chord, required this.isActive});

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
              child: Text(
                chord,
                style: musicTextTheme(context).titleLarge?.copyWith(
                  color:
                      isActive
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : CustomColorScheme.neutral50,
                  fontWeight: isActive ? FontWeight.bold : null,
                ),
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
                chord,
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
