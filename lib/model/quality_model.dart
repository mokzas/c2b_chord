import 'package:freezed_annotation/freezed_annotation.dart';

part 'quality_model.freezed.dart';
part 'quality_model.g.dart';

/// Chord의 quality를 구성하는 데이터.
///
/// Quality: 한 음(근음)으로부터 음을 쌓아올려 chord를 구성하는 규칙
///
/// [name] quality의 이름. ex) 'M'
///
/// [aliases] quality의 다른 표기법. ex) 'Maj', 'Δ'
///
/// [intervals] quality를 정수의 나열로 표현한 것. 각 숫자는 근음으로부터의
/// 거리. 거리값은 반음 간격을 1로 하여 계산한 결과. 모든 interval은
/// 0(근음)에서 시작. 각 interval값에 root값(0~11)을 더해 chord 구성음을
/// 구하는 데에 사용.
///
/// [notation] root, quality가 만나 chord 구성음들을 구했을 때, 각 음들을
/// 임시표가 붙지 않은 방식/♯이 붙는 방식/♭이 붙는 방식 중 어떤 방식으로
/// 표현해야하는지에 대한 정보
///
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