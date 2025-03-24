// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chord_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChordListItemModel _$ChordListItemModelFromJson(Map<String, dynamic> json) =>
    _ChordListItemModel(
      chord: ChordModel.fromJson(json['chord'] as Map<String, dynamic>),
      isSelected: json['isSelected'] as bool,
    );

Map<String, dynamic> _$ChordListItemModelToJson(_ChordListItemModel instance) =>
    <String, dynamic>{
      'chord': instance.chord,
      'isSelected': instance.isSelected,
    };
