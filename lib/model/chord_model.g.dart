// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chord_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChordModel _$ChordModelFromJson(Map<String, dynamic> json) => _ChordModel(
  name: json['name'] as String,
  nameAlt: (json['nameAlt'] as List<dynamic>).map((e) => e as String).toList(),
  root: $enumDecode(_$NoteEnumMap, json['root']),
  tones:
      (json['tones'] as List<dynamic>)
          .map((e) => $enumDecode(_$NoteEnumMap, e))
          .toList(),
  qualityName: json['qualityName'] as String,
);

Map<String, dynamic> _$ChordModelToJson(_ChordModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameAlt': instance.nameAlt,
      'root': _$NoteEnumMap[instance.root]!,
      'tones': instance.tones.map((e) => _$NoteEnumMap[e]!).toList(),
      'qualityName': instance.qualityName,
    };

const _$NoteEnumMap = {
  Note.c: 'c',
  Note.bS: 'bS',
  Note.cS: 'cS',
  Note.dF: 'dF',
  Note.d: 'd',
  Note.dS: 'dS',
  Note.eF: 'eF',
  Note.e: 'e',
  Note.fF: 'fF',
  Note.f: 'f',
  Note.eS: 'eS',
  Note.fS: 'fS',
  Note.gF: 'gF',
  Note.g: 'g',
  Note.gS: 'gS',
  Note.aF: 'aF',
  Note.a: 'a',
  Note.aS: 'aS',
  Note.bF: 'bF',
  Note.b: 'b',
  Note.cF: 'cF',
};
