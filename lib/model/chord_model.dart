import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/music.dart';

part 'chord_model.freezed.dart';
part 'chord_model.g.dart';

@freezed
abstract class ChordModel with _$ChordModel {
  const factory ChordModel({
    required String name,
    required List<String> nameAlt,
    required Note root,
    required List<Note> tones,
  }) = _ChordModel;

  factory ChordModel.fromJson(Map<String, Object?> json) => _$ChordModelFromJson(json);
}

