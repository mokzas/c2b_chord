// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresetModel _$PresetModelFromJson(Map<String, dynamic> json) => _PresetModel(
  id: json['id'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$PresetTypeEnumMap, json['type']),
  path: json['path'] as String,
  chordList:
      (json['chordList'] as List<dynamic>)
          .map((e) => ChordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  description: json['description'] as String?,
);

Map<String, dynamic> _$PresetModelToJson(_PresetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$PresetTypeEnumMap[instance.type]!,
      'path': instance.path,
      'chordList': instance.chordList,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'description': instance.description,
    };

const _$PresetTypeEnumMap = {
  PresetType.user: 'user',
  PresetType.builtin: 'builtin',
};
