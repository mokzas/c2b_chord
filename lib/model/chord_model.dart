import 'package:c2b/util/music.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chord_model.freezed.dart';
part 'chord_model.g.dart';

/// 하나의 Chord를 구성하는 데이터.
@freezed
abstract class ChordModel with _$ChordModel {
  const factory ChordModel({
    required String name,
    required List<String> nameAlt,
    required Note root,
    required List<Note> tones,
  }) = _ChordModel;

  factory ChordModel.fromJson(Map<String, Object?> json) =>
      _$ChordModelFromJson(json);
}
