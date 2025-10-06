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
          // 공용 로직으로 다음 chord로 이동 (자동 진행이므로 재생성 고려)
          _advanceToNextChord(
            triggerRegeneration: state.isPlaying && !state.isRepeat,
          );
          // tick은 콜백 tick으로 동기화
          state = state.copyWith(currentTick: newTick);
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
    state = state.copyWith(
      displayChordCount: count,
      reGenerateCount: getReGenerateCount(count),
      isPianoQuizOn: false,
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

  // 악보의 반이 지나가면 새로 랜덤 chord 생성, 최소 1
  int getReGenerateCount(int count) {
    final halfCount = count ~/ 2;
    final reGenerateCount = halfCount < 1 ? 1 : halfCount;
    return reGenerateCount;
  }

  /// 가상피아노 퀴즈모드를 토글하는 함수
  /// 반복 모드 ON 시 displayChordCount를 2로 변경
  void togglePianoQuiz() {
    if (state.isPianoQuizOn) {
      state = state.copyWith(
        isPianoQuizOn: false,
        displayChordCount: 2,
        reGenerateCount: getReGenerateCount(2),
        currentChordIndex: 0,
      );
    } else {
      state = state.copyWith(
        isPianoQuizOn: true,
        displayChordCount: 2,
        reGenerateCount: getReGenerateCount(2),
        currentChordIndex: 0,
      );
    }
  }

  /// 재생 없이 다음 코드로 강제 이동 (Quiz 모드용)
  /// tick은 0으로 초기화하고, 다음 index로 이동
  /// Repeat OFF일 때만 재생성, Repeat ON일 때는 index만 이동
  void goToNextChord() {
    _advanceToNextChord(triggerRegeneration: !state.isRepeat);
    state = state.copyWith(currentTick: 0, isCountDown: false);
  }

  /// 다음 chord로 이동하는 공용 로직.
  /// triggerRegeneration이 true이고 nextIndex가 reGenerateCount의 배수일 때만 재생성.
  void _advanceToNextChord({required bool triggerRegeneration}) {
    final nextIndex = (state.currentChordIndex + 1) % state.displayChordCount;
    state = state.copyWith(currentChordIndex: nextIndex);

    // 재생성 조건: nextIndex가 reGenerateCount의 배수일 때
    // 8개 모드: index 0→1→2→3→4(4%4==0, 재생성)→5→6→7→8(8%4==0, 재생성)...
    // 퀴즈 모드: index 0→1(1%1==0, 재생성)→2(2%1==0, 재생성)...
    // 원래 로직은 index를 리셋하지 않고 계속 증가시킴
    if (triggerRegeneration && nextIndex % state.reGenerateCount == 0) {
      ref.read(randomChordsProvider.notifier).reGeneratePart();
    }
  }
}
