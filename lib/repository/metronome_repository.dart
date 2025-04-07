import 'package:metronome/metronome.dart';

class MetronomeService {
  static Metronome metronome = Metronome();
  static bool isInit = false;
}

class MetronomeRepository {
  static Future<void> init(
    int bpm,
    int volume,
    int timeSignature,
    void Function(int) onTick,
  ) async {
    MetronomeService.isInit = false;
    MetronomeService.metronome
        .init(
      'assets/audio/woodblock_high44_wav.wav',
      accentedPath: 'assets/audio/claves44_wav.wav',
      bpm: bpm,
      volume: volume,
      enableTickCallback: true,
      timeSignature: timeSignature,
      sampleRate: 44100,
    )
        .then((_) {
      MetronomeService.metronome.tickStream.listen(onTick);
      MetronomeService.isInit = true;
    });
  }

  static void play() {
    if (MetronomeService.isInit == false) return;
    MetronomeService.metronome.play();
  }

  static void pause() {
    if (MetronomeService.isInit == false) return;
    MetronomeService.metronome.pause();
  }

  static void stop() {
    if (MetronomeService.isInit == false) return;
    MetronomeService.metronome.stop();
  }

  static void setBPM(int bpm) {
    if (MetronomeService.isInit == false) return;
    MetronomeService.metronome.setBPM(bpm);
  }

  static void setVolume(int volume) {
    if (MetronomeService.isInit == false) return;
    MetronomeService.metronome.setVolume(volume);
  }

  static void setTimeSignature(int timeSignature) {
    if (MetronomeService.isInit == false) return;
    MetronomeService.metronome.setTimeSignature(timeSignature);
  }

  // static void dispose() {
  //   MetronomeService.metronome.destroy();
  //   MetronomeService.isInitialized = false;
  // }
}
