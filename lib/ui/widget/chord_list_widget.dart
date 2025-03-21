import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/chord_list_provider.dart';

class ChordListWidget extends ConsumerWidget {
  const ChordListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chordListAsync = ref.watch(chordListProvider);

    return chordListAsync.when(
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (chordList) => ListView.separated(
        itemCount: chordList.length,
        itemBuilder: (context, index) {
          final chordItem = chordList[index];
          return ListTile(
            title: Text(
              '${chordItem.chord.name} ${chordItem.chord.tones.map((n) => n.str).join(", ")}',
              style: musicTextTheme(context).titleMedium,
            ),
            trailing: Checkbox(
              value: chordItem.isSelected,
              onChanged: (_) => ref.read(chordListProvider.notifier).updateSelection(chordItem.chord, !chordItem.isSelected),
              tristate: true,
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(height: 1.0),
        // shrinkWrap: true,
      ),
    );
  }
}