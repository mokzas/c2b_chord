import 'package:c2b_chord/providers/play_state_provider.dart';
import 'package:c2b_chord/ui/screens/play/beat_indicator_area.dart';
import 'package:c2b_chord/ui/screens/play/play_control_area.dart';
import 'package:c2b_chord/ui/screens/play/play_setting_area.dart';
import 'package:c2b_chord/ui/screens/play/score_area.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
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
  @override
  void initState() {
    // 가로모드 고정
    // SystemChrome.setPreferredOrientations([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final playState = ref.watch(playStateProvider);
    final currentTick = playState.currentTick;
    final timeSignature = playState.timeSignature;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: C2bPadding.longSide,
            // horizontal: GridMargin.shortSide,
          ),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? CircularProgressIndicator()
                  : Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 72.0),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    /* Volume Slider */
                                    SizedBox(
                                      width: 134.0,
                                      child: Slider(
                                        value:
                                            ref
                                                .watch(playStateProvider)
                                                .volume /
                                            100.0,
                                        onChanged: (newValue) {
                                          ref
                                              .read(playStateProvider.notifier)
                                              .setVolume(
                                                (newValue * 100).round(),
                                              );
                                        },
                                      ),
                                    ),
                                    /* Beat, BPM, ChordCount 설정 */
                                    const PlaySettingArea(),
                                    /* stop, play/pause, repeat, shuffle */
                                    const PlayControlArea(),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 72.0),
                            ],
                          ),
                          hGap8(),
                          BeatIndicatorArea(
                            count: timeSignature,
                            active: (currentTick % timeSignature) + 1,
                          ),
                          hGap24(),
                          ScoreArea(),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          final playState = ref.read(
                            playStateProvider.notifier,
                          );
                          playState.stop();
                          context.pop();
                        },
                      ),
                      // CountDown Overlay
                      if (playState.isCountDown)
                        GestureDetector(
                          onTap: () {
                            ref.read(playStateProvider.notifier).stop();
                          },
                          child: Container(
                            color: CustomColorScheme.barrierColor,
                            child: Center(
                              child: Text(
                                (timeSignature - currentTick).toString(),
                                style: Theme.of(
                                  context,
                                ).textTheme.displayLarge?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
            },
          ),
        ),
      ),
    );
  }
}
