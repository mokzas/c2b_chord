import 'package:c2b/model/play_state_model.dart';
import 'package:c2b/providers/random_chords_provider.dart';
import 'package:metronome/metronome.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'play_state_provider.g.dart';

/// 연습 중 메트로놈 재생, 악보(chord) 넘기기 등에 필요한 상태 정보 provider.
@riverpod
class PlayState extends _$PlayState {
  late final Metronome _metronome;

  @override
  PlayStateModel build() {
    _metronome = Metronome();
    _initMetronomeState();
    return const PlayStateModel();
  }

  /// 메트로놈 초기화
  void _initMetronomeState() {
    final initialState = const PlayStateModel();
    _metronome.init(
      'assets/audio/woodblock_high44_wav.wav',
      accentedPath: 'assets/audio/claves44_wav.wav',
      bpm: initialState.bpm,
      volume: initialState.volume,
      enableTickCallback: true,
      timeSignature: initialState.timeSignature,
      sampleRate: 44100,
    );

    // 메트로놈 매 Tick마다 호출되는 Callback
    // tick: 0 ~ timeSignature-1
    _metronome.tickStream.listen((newTick) {
      if (newTick == 0) {
        if (state.isFirstTickPlayed == false) {
          // Play 시작 후 첫 Tick인 경우
          state = state.copyWith(isFirstTickPlayed: true);
        } else {
          // Tick이 한 사이클(timeSignature 값)을 지나 0으로 돌아온 경우
        final nextIndex =
            (state.currentChordIndex + 1) % state.displayChordCount;
        state = state.copyWith(
          currentChordIndex: nextIndex,
          currentTick: newTick,
        );
          // ScoreArea에서 표시할 Chord가 모두 연주된 경우 새로운 랜덤 Chord 생성
          if (nextIndex == 0 && state.isPlaying) {
            ref.read(randomChordsProvider.notifier).reGenerate();
          }
        }
      } else {
        state = state.copyWith(currentTick: newTick);
      }
    });
  }

  /// 연습을 시작하는 함수
  void play() {
    _metronome.play();
    state = state.copyWith(isPlaying: true);
  }

  /// 연습을 진행중이던 위치에서 멈추는 함수
  /// 현재 연주중인 chord 위치는 유지, tick만 0으로 초기화
  void pause() {
    state = state.copyWith(
      isPlaying: false,
      isFirstTickPlayed: false,
      currentTick: 0,
    );
  }

  /// 연습을 완전히 중지하는 함수
  /// 현재 연주중인 chord 위치와 tick 모두 0으로 초기화
  void stop() {
    _metronome.stop();
    state = state.copyWith(
      isPlaying: false,
      isFirstTickPlayed: false,
      currentTick: 0,
      currentChordIndex: 0,
    );
  }

  void setBPM(int bpm) {
    _metronome.setBPM(bpm);
    state = state.copyWith(bpm: bpm);
  }

  void setVolume(int volume) {
    _metronome.setVolume(volume);
    state = state.copyWith(volume: volume);
  }

  void setTimeSignature(int timeSignature) {
    _metronome.setTimeSignature(timeSignature);
    state = state.copyWith(timeSignature: timeSignature);
  }

  void setDisplayChordCount(int count) {
    state = state.copyWith(
      displayChordCount: count,
      currentChordIndex: 0,
    );
  }

  void dispose() {
    _metronome.destroy();
  }
}
