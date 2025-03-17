import 'package:freezed_annotation/freezed_annotation.dart';

part 'chord.freezed.dart';
part 'chord.g.dart';

@freezed
abstract class Chord with _$Chord {
  const factory Chord({
    required String name,
    required List<String> nameAlt,
  }) = _Chord;

  factory Chord.fromJson(Map<String, Object?> json) => _$ChordFromJson(json);
}

