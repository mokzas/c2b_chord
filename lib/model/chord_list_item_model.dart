import 'package:c2b/model/chord_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chord_list_item_model.freezed.dart';
part 'chord_list_item_model.g.dart';

@freezed
abstract class ChordListItemModel with _$ChordListItemModel {
  const factory ChordListItemModel({
    required ChordModel chord,
    required bool isSelected,
  }) = _ChordListItemModel;

  factory ChordListItemModel.fromJson(Map<String, Object?> json) => _$ChordListItemModelFromJson(json);
}

