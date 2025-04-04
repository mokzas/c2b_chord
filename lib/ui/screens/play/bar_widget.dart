import 'package:c2b/ui/theme/const.dart';
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

  const BarWidget({
    super.key,
    required this.chord,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          Container(
            height: 80.0,
            constraints: BoxConstraints(minWidth: 140.0),
            decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(RadiusValue.small),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                chord,
                style: musicTextTheme(context).titleLarge?.copyWith(
                      color: isActive
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : CustomColorScheme.neutral50,
                      fontWeight: isActive ? FontWeight.bold : null,
                    ),
              ),
            ),
          ),
          hGap4(),
          Container(
            height: 4.0,
            constraints: BoxConstraints(minWidth: 140.0),
            decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : CustomColorScheme.neutral50,
              borderRadius: BorderRadius.circular(RadiusValue.full),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                chord,
                style: musicTextTheme(context)
                    .titleLarge
                    ?.copyWith(color: Colors.transparent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
