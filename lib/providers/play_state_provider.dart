import 'package:c2b/model/play_state_model.dart';
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

    _metronome.tickStream.listen((tick) {
      state = state.copyWith(currentTick: tick);
    });
  }

  /// 연습을 시작하는 함수
  void play() {
    _metronome.play();
    state = state.copyWith(isPlaying: true);
  }

  /// 연습을 잠시 멈추는 함수
  void pause() {
    _metronome.pause();
    state = state.copyWith(isPlaying: false);
  }

  /// 연습을 완전히 중지하는 함수
  void stop() {
    _metronome.stop();
    state = state.copyWith(isPlaying: false, currentTick: 0);
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

  void dispose() {
    _metronome.destroy();
  }
}
