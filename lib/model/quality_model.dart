import 'package:freezed_annotation/freezed_annotation.dart';

part 'quality_model.freezed.dart';
part 'quality_model.g.dart';

/// Chord의 quality를 구성하는 데이터.
@freezed
abstract class QualityModel with _$QualityModel {
  const factory QualityModel({
    required String name,
    required List<String> aliases,
    required List<int> intervals,
    required List<String> notation,
  }) = _QualityModel;

  factory QualityModel.fromJson(Map<String, dynamic> json) => _$QualityModelFromJson(json);
}