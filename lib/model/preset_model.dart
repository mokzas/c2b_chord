import 'package:c2b_chord/model/chord_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preset_model.freezed.dart';
part 'preset_model.g.dart';

/// Preset 타입
enum PresetType { user, builtin }

/// Preset 데이터
///
/// [String] id - 프리셋 고유 ID
///
/// [String] name - 프리셋 이름
///
/// [PresetType] type - 프리셋 타입 (user / builtin)
///
/// [String] path - 폴더 경로 (예: "user/jazz", "builtin/major_diatonic")
///
/// [List<ChordListItemModel>] chordListItems - 프리셋에 포함된 코드 리스트
///
/// [DateTime] createdAt - 생성 시간
///
/// [DateTime] updatedAt - 수정 시간
///
/// [String?] description - 프리셋 설명 (선택사항)
///
@freezed
abstract class PresetModel with _$PresetModel {
  const factory PresetModel({
    required String id,
    required String name,
    required PresetType type,
    required String path,
    required List<ChordModel> chordList,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? description,
  }) = _PresetModel;

  factory PresetModel.fromJson(Map<String, Object?> json) =>
      _$PresetModelFromJson(json);
}
