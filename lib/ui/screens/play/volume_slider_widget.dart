import 'package:c2b_chord/providers/play_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VolumeSliderWidget extends ConsumerWidget {
  const VolumeSliderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 134.0,
      child: Slider(
        value: ref.watch(playStateProvider).volume / 100.0,
        onChanged: (newValue) {
          ref
              .read(playStateProvider.notifier)
              .setVolume((newValue * 100).round());
        },
      ),
    );
  }
}
