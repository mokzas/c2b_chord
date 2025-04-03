import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_list_item_model.freezed.dart';
part 'filter_list_item_model.g.dart';

/// 선택가능한 Filter 리스트의 각 아이템이 갖는 데이터.
///
/// [name] filter의 이름. ex) 'C♯', 'M7', 'alt'
///
/// [group] filter의 그룹. ex) 'Root', '7th', 'Alter, add'
///
/// [isSelected] 해당 filter가 현재 UI에서 선택됐는지 타나냄.
///
@freezed
abstract class FilterListItemModel with _$FilterListItemModel {
  const factory FilterListItemModel({
    required String name,
    required String group,
    required bool isSelected,
  }) = _FilterListItemModel;

  factory FilterListItemModel.fromJson(Map<String, Object?> json) =>
      _$FilterListItemModelFromJson(json);
}
