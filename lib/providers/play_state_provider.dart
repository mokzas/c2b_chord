import 'package:c2b_chord/model/play_state_model.dart';
import 'package:c2b_chord/providers/random_chords_provider.dart';
import 'package:c2b_chord/repository/metronome_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'play_state_provider.g.dart';

/// 연습 중 메트로놈 재생, 악보(chord) 넘기기 등에 필요한 상태 정보 provider.
@riverpod
class PlayState extends _$PlayState {
  @override
  PlayStateModel build() {
    final initialState = const PlayStateModel();

    MetronomeRepository.init(
      initialState.bpm,
      initialState.volume,
      initialState.timeSignature,
      // 메트로놈 매 Tick마다 호출되는 Callback
      // tick: 0 ~ timeSignature-1
      (newTick) {
        if (state.isFirstTickPlayed == false) {
          // CASE 1: Play 시작 후 첫 Tick callback 호출.
          // 이 분기는 if(newTick==0) 분기문을 두번째 newTick==0 케이스부터 타도록 하기 위해 존재.
          // AOS: newTick==1 (tick 0에서 호출되지 않는 이슈 있음)
          // iOS: newTick==0
          state = state.copyWith(isFirstTickPlayed: true, currentTick: newTick);
        } else if (newTick == 0 && state.isCountDown) {
          // 첫번째 사이클에서는 count down 진행
          state = state.copyWith(currentTick: newTick, isCountDown: false);
        } else if (newTick == 0) {
          // CASE 2: Tick이 한 사이클(timeSignature 값)을 지나 0으로 돌아온 경우
          // 연습 중인 chord를 다음 chord로 넘김.
          final nextIndex =
              (state.currentChordIndex + 1) % state.displayChordCount;
          state = state.copyWith(
            currentChordIndex: nextIndex,
            currentTick: newTick,
          );
          // CASE 2+: ScoreArea의 Chord가 [reGenerateCount]번째 chord까지 연주된 경우
          // 새로운 랜덤 Chord 생성. 단, 반복 모드인 경우는 생성하지 않음.
          if (nextIndex % state.reGenerateCount == 0 &&
              state.isPlaying &&
              !state.isRepeat) {
            ref.read(randomChordsProvider.notifier).reGeneratePart();
          }
        } else {
          // CASE Default
          state = state.copyWith(currentTick: newTick);
        }
      },
    );

    return const PlayStateModel();
  }

  /// 연습을 시작하는 함수
  void play() {
    MetronomeRepository.play();
    state = state.copyWith(isPlaying: true, isCountDown: true);
  }

  /// 연습을 진행중이던 위치에서 멈추는 함수
  /// 현재 연주중인 chord 위치는 유지, tick만 0으로 초기화
  void pause() {
    MetronomeRepository.pause();
    state = state.copyWith(
      isPlaying: false,
      isFirstTickPlayed: false,
      currentTick: 0,
      isCountDown: false,
    );
  }

  /// 연습을 완전히 중지하는 함수
  /// 현재 연주중인 chord 위치와 tick 모두 0으로 초기화
  void stop() {
    MetronomeRepository.stop();
    state = state.copyWith(
      isPlaying: false,
      isFirstTickPlayed: false,
      currentTick: 0,
      isCountDown: false,
      currentChordIndex: 0,
    );
  }

  void setBPM(int bpm) {
    MetronomeRepository.setBPM(bpm);
    state = state.copyWith(bpm: bpm);
  }

  void setVolume(int volume) {
    MetronomeRepository.setVolume(volume);
    state = state.copyWith(volume: volume);
  }

  void setTimeSignature(int timeSignature) {
    MetronomeRepository.setTimeSignature(timeSignature);
    state = state.copyWith(timeSignature: timeSignature);
  }

  void setDisplayChordCount(int count) {
    // 악보의 반이 지나가면 새로 랜덤 chord 생성, 최소 1
    final halfCount = count ~/ 2;
    final reGenerateCount = halfCount < 1 ? 1 : halfCount;

    state = state.copyWith(
      displayChordCount: count,
      reGenerateCount: reGenerateCount,
      currentChordIndex: 0,
    );

    ref.read(randomChordsProvider.notifier).reGenerate();
  }

  /// 반복 모드를 토글하는 함수
  /// 반복 모드 ON/OFF 시 chord index를 0으로 초기화
  void toggleRepeat() {
    state = state.copyWith(isRepeat: !state.isRepeat, currentChordIndex: 0);
  }

  /// 코드 구성음 보여주기를 토글하는 함수
  void toggleShowNote() {
    state = state.copyWith(isShowNoteOn: !state.isShowNoteOn);
  }

  /// 가상피아노 퀴즈모드를 토글하는 함수
  /// 반복 모드 ON 시 displayChordCount를 2로 변경
  /// 반복 모드 OFF 시 displayChordCount를 8로 값으로 변경
  void togglePianoQuiz() {
    if (state.isPianoQuizOn) {
      state = state.copyWith(isPianoQuizOn: false, displayChordCount: 8);
    } else {
      state = state.copyWith(isPianoQuizOn: true, displayChordCount: 2);
    }
  }
}
