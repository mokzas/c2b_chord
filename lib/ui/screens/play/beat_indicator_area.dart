import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';

/// 메트로놈 현재 tick을 표시하는 위젯
///
/// [count] chord 하나당 메트로놈 tick 수 (메트로놈의 timeSignature)
/// count만큼의 beatIndicator가 표시됨.
///
/// [active] 현재 tick 값. 표시된 beatIndicator 중
/// [active]번째 beatIndicator를 다른 색으로 나타냄
class BeatIndicatorArea extends StatelessWidget {
  const BeatIndicatorArea({
    super.key,
    required this.count,
    required this.active,
  });

  final int count;
  final int active;

  @override
  Widget build(BuildContext context) {
    List<Widget> beatIndicatorWidgets = [];
    for (int i = 0; i < count; ++i) {
      beatIndicatorWidgets.add(_BeatIndicatorWidget(active: (active == i + 1)));
      if (count != i + 1) {
        beatIndicatorWidgets.add(wGap4());
      }
    }
    return Row(
      children: [
        Expanded(child: Container()),
        Row(children: beatIndicatorWidgets),
        Expanded(child: Container()),
      ],
    );
  }
}

class _BeatIndicatorWidget extends StatelessWidget {
  const _BeatIndicatorWidget({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: C2bWidth.beatIndicator / 2,
    backgroundColor:
        active
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.surfaceContainerHighest,
  );
}
