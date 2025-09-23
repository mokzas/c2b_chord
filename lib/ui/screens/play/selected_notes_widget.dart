import 'package:c2b_chord/providers/piano_state_provider.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonic/tonic.dart';

/// 피아노에서 선택된 노트들을 표시하는 위젯
class SelectedNotesWidget extends ConsumerWidget {
  const SelectedNotesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pianoState = ref.watch(pianoStateProvider);
    final selectedNotes =
        pianoState.pressedKeys
            .map((midi) => Pitch.fromMidiNumber(midi).toString())
            .toList()
          ..sort(); // 알파벳 순으로 정렬

    return Container(
      padding: EdgeInsets.all(C2bPadding.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedNotes.isEmpty)
            Text(
              'No notes selected',
              style: musicTextTheme(context).bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
                fontStyle: FontStyle.italic,
              ),
            )
          else
            Wrap(
              spacing: C2bPadding.small,
              runSpacing: C2bPadding.small,
              children:
                  selectedNotes.map((note) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: C2bPadding.small,
                        vertical: C2bPadding.extraSmall,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(C2bRadius.small),
                      ),
                      child: Text(
                        note,
                        style: musicTextTheme(context).bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
            ),
        ],
      ),
    );
  }
}
