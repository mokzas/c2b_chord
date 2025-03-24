import 'package:c2b/providers/chord_list_provider.dart';
import 'package:c2b/providers/selected_chords_provider.dart';
import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedChordsWidget extends ConsumerWidget {
  const SelectedChordsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChords = ref.watch(selectedChordsProvider);

    return ListView.separated(
      itemCount: selectedChords.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusValue.small),
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              color: Colors.grey.shade400,
              offset: Offset(0.0, 1.0),
            ),
          ],
          color: Theme.of(context).colorScheme.surfaceContainerLowest,
        ),
        child: ListTile(
          title: Text(
            selectedChords[index].name,
            style: musicTextTheme(context).titleMedium,
            // overflow: TextOverflow.,
          ),
          trailing: IconButton(
            onPressed: () => ref
                .read(chordListProvider.notifier)
                .updateSelection(selectedChords[index], false),
            icon: Icon(
              Icons.remove_circle,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusValue.small),
          ),
        ),
      ),
      separatorBuilder: (_, __) => hGap4(),
    );
  }
}
