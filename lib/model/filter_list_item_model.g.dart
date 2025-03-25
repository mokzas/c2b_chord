// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FilterListItemModel _$FilterListItemModelFromJson(Map<String, dynamic> json) =>
    _FilterListItemModel(
      name: json['name'] as String,
      group: json['group'] as String,
      isSelected: json['isSelected'] as bool,
    );

Map<String, dynamic> _$FilterListItemModelToJson(
        _FilterListItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'group': instance.group,
      'isSelected': instance.isSelected,
    };
