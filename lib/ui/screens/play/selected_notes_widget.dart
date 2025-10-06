import 'package:c2b_chord/providers/piano_state_provider.dart';
import 'package:c2b_chord/providers/play_state_provider.dart';
import 'package:c2b_chord/providers/random_chords_provider.dart';
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
    final playState = ref.watch(playStateProvider);
    final randomChords = ref.watch(randomChordsProvider);

    final selectedNotes =
        pianoState.pressedKeys
            .map((midi) => Pitch.fromMidiNumber(midi).toString())
            .toList()
          ..sort(); // 알파벳 순으로 정렬

    // 현재 코드의 구성음 (MIDI 값 / 12로 옥타브 무시)
    final currentChord =
        randomChords.isNotEmpty
            ? randomChords[playState.currentChordIndex %
                playState.reGenerateCount]
            : null;
    final currentChordNotes =
        currentChord?.tones
            .map((note) => note.pitch) // Note의 pitch 값 사용 (0-11)
            .toSet() ??
        <int>{};

    // 선택된 노트들의 옥타브 무시한 pitch 값들
    final selectedNotesPitch =
        pianoState.pressedKeys
            .map((midi) => midi % 12) // 0-11 범위로 변환
            .toSet();

    // 선택된 노트들이 현재 코드의 구성음과 정확히 일치하는지 확인
    final isChordMatch =
        currentChordNotes.isNotEmpty &&
        selectedNotesPitch.length == currentChordNotes.length &&
        selectedNotesPitch.every((pitch) => currentChordNotes.contains(pitch));

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
                        color:
                            isChordMatch
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(C2bRadius.small),
                        border:
                            isChordMatch
                                ? null
                                : Border.all(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.outline.withValues(alpha: 0.3),
                                  width: 1,
                                ),
                      ),
                      child: Text(
                        note,
                        style: musicTextTheme(context).bodyMedium?.copyWith(
                          color:
                              isChordMatch
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onSurface,
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
