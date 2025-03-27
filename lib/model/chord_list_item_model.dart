import 'package:c2b/model/chord_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chord_list_item_model.freezed.dart';
part 'chord_list_item_model.g.dart';

/// 선택가능한 Chord 리스트의 각 아이템이 갖는 데이터.
///
/// [chord] chord 데이터.
///
/// [isSelected] 해당 chord가 현재 UI에서 선택됐는지 타나냄.
///
@freezed
abstract class ChordListItemModel with _$ChordListItemModel {
  const factory ChordListItemModel({
    required ChordModel chord,
    required bool isSelected,
  }) = _ChordListItemModel;

  factory ChordListItemModel.fromJson(Map<String, Object?> json) => _$ChordListItemModelFromJson(json);
}

