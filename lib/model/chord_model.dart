import 'package:c2b_chord/util/music.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chord_model.freezed.dart';
part 'chord_model.g.dart';

/// 하나의 Chord를 구성하는 데이터.
///
/// [name] chord의 이름. ex) 'M'.
///
/// [nameAlt] 동일한 chord의 다른 표기법. ex) 'Maj, 'Δ'.
/// QualityModel([model/quality_model.dart])의 [aliases]와 연관.
///
/// [root] chord의 근음.
///
/// [tones] chord를 구성하는 음들. chord tones.
///
/// [qualityName] quality의 이름. ex) 'M7', 'dim7', 'aug7'
///
@freezed
abstract class ChordModel with _$ChordModel {
  const factory ChordModel({
    required String name,
    required List<String> nameAlt,
    required Note root,
    required List<Note> tones,
    required String qualityName,
  }) = _ChordModel;

  factory ChordModel.fromJson(Map<String, Object?> json) =>
      _$ChordModelFromJson(json);
}
