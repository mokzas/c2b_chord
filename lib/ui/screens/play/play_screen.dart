import 'package:c2b_chord/providers/piano_state_provider.dart';
import 'package:c2b_chord/providers/play_state_provider.dart';
import 'package:c2b_chord/ui/screens/play/beat_indicator_area.dart';
import 'package:c2b_chord/ui/screens/play/play_control_area.dart';
import 'package:c2b_chord/ui/screens/play/play_setting_area.dart';
import 'package:c2b_chord/ui/screens/play/quiz_control_area.dart';
import 'package:c2b_chord/ui/screens/play/score_area.dart';
import 'package:c2b_chord/ui/screens/play/volume_slider_widget.dart';
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

    // 코드가 변경될 때 피아노 키 리셋
    ref.listen(playStateProvider, (previous, next) {
      if (previous?.currentChordIndex != next.currentChordIndex) {
        ref.read(pianoStateProvider.notifier).clearAllKeys();
      }
    });

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
                              SizedBox(width: C2bMargin.extraLarge),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    /* 왼쪽 그룹: Volume Slider, QuizControlArea */
                                    Row(
                                      children: [
                                        const VolumeSliderWidget(),
                                        const QuizControlArea(),
                                      ],
                                    ),
                                    /* 중앙: PlaySettingArea */
                                    const PlaySettingArea(),
                                    /* 오른쪽: PlayControlArea */
                                    const PlayControlArea(),
                                  ],
                                ),
                              ),
                              SizedBox(width: C2bMargin.extraLarge),
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
                          final pianoState = ref.read(
                            pianoStateProvider.notifier,
                          );
                          playState.stop();
                          pianoState.clearAllKeys(); // 피아노 키 리셋
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
