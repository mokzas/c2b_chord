import 'package:c2b_chord/providers/guide_state_provider.dart';
import 'package:c2b_chord/providers/piano_state_provider.dart';
import 'package:c2b_chord/providers/play_state_provider.dart';
import 'package:c2b_chord/providers/random_chords_provider.dart';
import 'package:c2b_chord/ui/screens/play/beat_indicator_area.dart';
import 'package:c2b_chord/ui/screens/play/play_control_area.dart';
import 'package:c2b_chord/ui/screens/play/play_screen_guide.dart';
import 'package:c2b_chord/ui/screens/play/play_setting_area.dart';
import 'package:c2b_chord/ui/screens/play/quiz_control_area.dart';
import 'package:c2b_chord/ui/screens/play/score_area.dart';
import 'package:c2b_chord/ui/screens/play/volume_slider_widget.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:c2b_chord/ui/widgets/guide_overlay.dart';
import 'package:c2b_chord/ui/widgets/quiz_correct_overlay.dart';
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
  bool _showCorrectOverlay = false;

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

  /// 정답 여부를 확인하는 함수
  bool _checkIfCorrect() {
    final playState = ref.read(playStateProvider);
    final pianoState = ref.read(pianoStateProvider);
    final randomChords = ref.read(randomChordsProvider);

    // 퀴즈 모드가 아니면 false
    if (!playState.isPianoQuizOn) return false;

    // 현재 코드의 구성음 (pitch 0-11)
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
    return currentChordNotes.isNotEmpty &&
        selectedNotesPitch.isNotEmpty &&
        selectedNotesPitch.length == currentChordNotes.length &&
        selectedNotesPitch.every((pitch) => currentChordNotes.contains(pitch));
  }

  @override
  Widget build(BuildContext context) {
    final playState = ref.watch(playStateProvider);
    final guideStateAsync = ref.watch(guideStateProvider);
    final currentTick = playState.currentTick;
    final timeSignature = playState.timeSignature;

    // 코드가 변경될 때 피아노 키 리셋 및 오버레이 숨김
    ref.listen(playStateProvider, (previous, next) {
      if (previous?.currentChordIndex != next.currentChordIndex) {
        ref.read(pianoStateProvider.notifier).clearAllKeys();
        setState(() {
          _showCorrectOverlay = false;
        });
      }
    });

    // Quiz 모드 진입/종료 감지
    ref.listen(playStateProvider, (previous, next) {
      // Quiz 모드 진입 시 가이드 표시
      if (previous?.isPianoQuizOn == false && next.isPianoQuizOn == true) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            ref.read(guideStateProvider.notifier).showQuizModeGuide();
          }
        });
      }
      // Quiz 모드 종료 시 오버레이 숨김
      if (previous?.isPianoQuizOn == true && next.isPianoQuizOn == false) {
        setState(() {
          _showCorrectOverlay = false;
        });
      }
    });

    // 피아노 키 변경 시 정답 확인
    ref.listen(pianoStateProvider, (previous, next) {
      final currentPlayState = ref.read(playStateProvider);
      if (currentPlayState.isPianoQuizOn && !_showCorrectOverlay) {
        if (_checkIfCorrect()) {
          setState(() {
            _showCorrectOverlay = true;
          });
        }
      }
    });

    return guideStateAsync.when(
      data:
          (guideState) => GuideOverlay(
            isVisible: guideState.showPlayScreenGuide,
            title: 'Play Screen Guide',
            description: PlayScreenGuide.buildPlayScreenGuideDescription(
              context,
            ),
            buttonText: 'Next',
            onButtonPressed: () {
              ref.read(guideStateProvider.notifier).hidePlayScreenGuide();
            },
            onDontShowAgain: () {
              ref
                  .read(guideStateProvider.notifier)
                  .dontShowPlayScreenGuideAgain();
            },
            child: GuideOverlay(
              isVisible: guideState.showQuizModeGuide,
              title: 'Chord Tone Quiz!',
              description: PlayScreenGuide.buildQuizModeGuideDescription(
                context,
              ),
              buttonText: 'Start',
              onButtonPressed: () {
                ref.read(guideStateProvider.notifier).hideQuizModeGuide();
              },
              onDontShowAgain: () {
                ref
                    .read(guideStateProvider.notifier)
                    .dontShowQuizModeGuideAgain();
              },
              child: Scaffold(
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(width: C2bMargin.extraLarge),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                // Quiz Clear button overlay at left edge when quiz on & not playing
                                if (playState.isPianoQuizOn &&
                                    !playState.isPlaying)
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: C2bPadding.longSide,
                                        bottom: C2bPadding.longSide * 3,
                                      ),
                                      child: SizedBox(
                                        width: 72,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // dim strip behind the button, non-interactive
                                            IgnorePointer(
                                              ignoring: true,
                                              child: Container(
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface
                                                      .withValues(alpha: 0.15),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        C2bRadius.medium,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.9,
                                              child: FloatingActionButton(
                                                heroTag: 'quizClearFAB',
                                                tooltip: 'Clear selected keys',
                                                onPressed: () {
                                                  ref
                                                      .read(
                                                        pianoStateProvider
                                                            .notifier,
                                                      )
                                                      .clearAllKeys();
                                                },
                                                child: Icon(Icons.refresh),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                // Quiz Next overlay at right edge when quiz on & not playing
                                if (playState.isPianoQuizOn &&
                                    !playState.isPlaying)
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right: C2bPadding.longSide,
                                        bottom: C2bPadding.longSide * 3,
                                      ),
                                      child: SizedBox(
                                        width: 72,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // dim strip behind the button, non-interactive
                                            IgnorePointer(
                                              ignoring: true,
                                              child: Container(
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface
                                                      .withValues(alpha: 0.15),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        C2bRadius.medium,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.9,
                                              child: FloatingActionButton(
                                                heroTag: 'quizNextFAB',
                                                tooltip: 'Next chord',
                                                onPressed: () {
                                                  ref
                                                      .read(
                                                        playStateProvider
                                                            .notifier,
                                                      )
                                                      .goToNextChord();
                                                },
                                                child: Icon(Icons.skip_next),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
                                      ref
                                          .read(playStateProvider.notifier)
                                          .stop();
                                    },
                                    child: Container(
                                      color: CustomColorScheme.barrierColor,
                                      child: Center(
                                        child: Text(
                                          (timeSignature - currentTick)
                                              .toString(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.displayLarge?.copyWith(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.onSecondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                // Quiz Correct Overlay
                                if (_showCorrectOverlay)
                                  QuizCorrectOverlay(
                                    onNext: () {
                                      setState(() {
                                        _showCorrectOverlay = false;
                                      });
                                    },
                                  ),
                              ],
                            );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error:
          (error, stack) =>
              Scaffold(body: Center(child: Text('Error: $error'))),
    );
  }
}
