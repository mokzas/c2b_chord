import 'package:c2b/providers/play_state_provider.dart';
import 'package:c2b/ui/screens/play/score_area.dart';
import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlayScreen extends ConsumerStatefulWidget {
  const PlayScreen({super.key});

  static const name = 'play';

  @override
  ConsumerState<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends ConsumerState<PlayScreen> {
  Widget _volumeSlider() => SizedBox(
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

  // Beat/BPM/ChordCount
  Widget _optionSelector() => Row(
        children: [
          /* Beat 수 */
          Column(
            children: [
              Text(
                ref.watch(playStateProvider).timeSignature.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Beat',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: CustomColorScheme.neutral50),
              ),
            ],
          ),
          wGap8(),
          /* BPM */
          Column(
            children: [
              Text(
                ref.watch(playStateProvider).bpm.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'BPM',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: CustomColorScheme.neutral50),
              ),
            ],
          ),
          wGap8(),
          /* 화면에 보여줄 chord 개수 */
          Column(
            children: [
              Text(
                '8',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Chords',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: CustomColorScheme.neutral50),
              ),
            ],
          ),
        ],
      );

  // practice start/stop/repeat
  Widget _playStopRepeatController() => Row(
        children: [
          Container(
            width: 32.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(RadiusValue.extraSmall),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              icon: Icon(Icons.stop_rounded),
              onPressed: () {
                ref.read(playStateProvider.notifier).stop();
              },
            ),
          ),
          wGap8(),
          Container(
            width: 32.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(RadiusValue.extraSmall),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              icon: Icon(
                ref.watch(playStateProvider).isPlaying
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
              ),
              onPressed: () {
                final controller = ref.read(playStateProvider.notifier);
                if (ref.read(playStateProvider).isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }
              },
            ),
          ),
          wGap8(),
          Container(
            width: 32.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(RadiusValue.extraSmall),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              icon: Icon(Icons.repeat_rounded),
              onPressed: () {
                // TODO: Implement repeat functionality
              },
            ),
          ),
        ],
      );

  // upper widgets (volume, option, controller)
  Widget _controllerWidgets() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 72.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _volumeSlider(),
                _optionSelector(),
                _playStopRepeatController(),
              ],
            ),
          ),
          const SizedBox(width: 72.0),
        ],
      );

  // beat indicator widget
  Widget _beatIndicator({required bool active}) => CircleAvatar(
        radius: 8.0,
        backgroundColor: active ? Color(0xff655a6f) : Color(0xffe9e0eb),
      );

  /// 메트로놈 현재 tick 표시하는 위젯
  Widget _beatIndicatorWidgets(int count, int active) {
    List<Widget> beatIndicatorWidgets = [];
    for (int i = 0; i < count; ++i) {
      beatIndicatorWidgets.add(_beatIndicator(active: (active == i + 1)));
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

  @override
  void initState() {
    // 가로모드 고정
    SystemChrome.setPreferredOrientations([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTick = ref.watch(playStateProvider).currentTick;
    final timeSignature = ref.watch(playStateProvider).timeSignature;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: GridMargin.longSide,
            // horizontal: GridMargin.shortSide,
          ),
          child: OrientationBuilder(builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? CircularProgressIndicator()
                : Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _controllerWidgets(),
                          hGap8(),
                          _beatIndicatorWidgets(
                              timeSignature, (currentTick % timeSignature) + 1),
                          hGap24(),
                          ScoreArea(),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          final playState =
                              ref.read(playStateProvider.notifier);
                          playState.stop();
                          playState.dispose();

                          context.pop();
                        },
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
