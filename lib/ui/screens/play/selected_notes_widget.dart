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

    // MIDI 번호와 노트 이름을 함께 저장 (정렬된 순서)
    final selectedNotesWithMidi =
        pianoState.pressedKeys
            .map(
              (midi) => (
                midi: midi,
                name: Pitch.fromMidiNumber(midi).toString(),
              ),
            )
            .toList()
          ..sort((a, b) => a.name.compareTo(b.name)); // 알파벳 순으로 정렬

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

    return Container(
      padding: EdgeInsets.all(C2bPadding.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedNotesWithMidi.isEmpty)
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
                  selectedNotesWithMidi.map((noteInfo) {
                    // 이 노트의 pitch (0-11)
                    final notePitch = noteInfo.midi % 12;
                    // 이 노트가 현재 코드 구성음에 포함되는지 확인
                    final isInChord = currentChordNotes.contains(notePitch);

                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: C2bPadding.small,
                        vertical: C2bPadding.extraSmall,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isInChord
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(C2bRadius.small),
                        border:
                            isInChord
                                ? null
                                : Border.all(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.outline.withValues(alpha: 0.3),
                                  width: 1,
                                ),
                      ),
                      child: Text(
                        noteInfo.name,
                        style: musicTextTheme(context).bodyMedium?.copyWith(
                          color:
                              isInChord
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
