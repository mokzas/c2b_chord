import 'package:c2b/providers/chord_list_provider.dart';
import 'package:c2b/providers/filtered_chords_provider.dart';
import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 선택가능한 Chord들을 보여주는 영역.
/// 선택된 filter가 있으면 해당 filter에 맞는 Chord만 보여줌.
class ChordListArea extends ConsumerWidget {
  const ChordListArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredChords = ref.watch(filteredChordsProvider);

    return ListView.separated(
      itemCount: filteredChords.length,
      itemBuilder: (context, index) {
        final chordItem = filteredChords[index];
        return ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                chordItem.chord.name,
                style: musicTextTheme(context).titleMedium,
              ),
              wGap8(),
              Text(
                chordItem.chord.tones.map((n) => n.str).join(", "),
                style: musicTextTheme(context).bodySmall,
              ),
            ],
          ),
          trailing: Checkbox(
            value: chordItem.isSelected,
            onChanged: (_) => ref
                .read(chordListProvider.notifier)
                .updateSelection(chordItem.chord, !chordItem.isSelected),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(height: 1.0),
      // shrinkWrap: true,
    );
  }
}
