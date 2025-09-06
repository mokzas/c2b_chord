import 'package:c2b_chord/providers/play_state_provider.dart';
import 'package:c2b_chord/ui/screens/play/number_selector_dialog.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 개별 설정 위젯 (Beat, BPM, Chords 등)
///
/// [title] 설정 항목의 제목 (예: 'Beat', 'BPM', 'Chords')
/// [value] 현재 설정된 값
/// [dialogTitle] 다이얼로그 제목
/// [minValue] 최소값
/// [maxValue] 최대값
/// [values] 선택 가능한 값들의 리스트 (선택사항)
/// [onValueChanged] 값이 변경될 때 호출되는 콜백
class PlaySettingWidget extends ConsumerWidget {
  const PlaySettingWidget({
    super.key,
    required this.title,
    required this.value,
    required this.dialogTitle,
    required this.minValue,
    required this.maxValue,
    this.values,
    required this.onValueChanged,
  });

  final String title;
  final int value;
  final String dialogTitle;
  final int minValue;
  final int maxValue;
  final List<int>? values;
  final ValueChanged<int> onValueChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playState = ref.watch(playStateProvider);

    return GestureDetector(
      onTap:
          playState.isPlaying
              ? null
              : () {
                showDialog(
                  context: context,
                  builder:
                      (context) => NumberSelectorDialog(
                        title: dialogTitle,
                        initialValue: value,
                        minValue: minValue,
                        maxValue: maxValue,
                        values: values,
                        onValueChanged: onValueChanged,
                      ),
                );
              },
      child: Column(
        children: [
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color:
                  playState.isPlaying
                      ? Theme.of(
                        context,
                      ).textTheme.titleLarge?.color?.withValues(alpha: 0.5)
                      : null,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color:
                  playState.isPlaying
                      ? CustomColorScheme.neutral50.withValues(alpha: 0.5)
                      : CustomColorScheme.neutral50,
            ),
          ),
        ],
      ),
    );
  }
}
