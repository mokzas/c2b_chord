import 'package:c2b/providers/chord_list_provider.dart';
import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 전체 Chord 중 선택된 Chord들을 보여주는 영역
class SelectedChordsArea extends ConsumerWidget {
  const SelectedChordsArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chordListAsync = ref.watch(chordListProvider);

    return chordListAsync.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (chordList) {
        final selectedChords = chordList
            .where((item) => item.isSelected)
            .map((item) => item.chord)
            .toList();

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected (${selectedChords.length})',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    hGap4(),
                    Container(
                      width: 36.0,
                      height: 1.0,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ],
                ),
                Icon(
                  Icons.bookmark_add,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            hGap16(),
            Expanded(
              child: selectedChords.isEmpty
                  ? Center(
                      child: Text(
                        'No chords.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  : ListView.separated(
                      itemCount: selectedChords.length,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(RadiusValue.small),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.0,
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 1.0),
                            ),
                          ],
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerLowest,
                        ),
                        child: ListTile(
                          title: Text(
                            selectedChords[index].name,
                            style: musicTextTheme(context).titleMedium,
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
                            borderRadius:
                                BorderRadius.circular(RadiusValue.small),
                          ),
                        ),
                      ),
                      separatorBuilder: (_, __) => hGap4(),
                    ),
            ),
          ],
        );
      },
    );
  }
}
