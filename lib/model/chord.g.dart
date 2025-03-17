// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chord _$ChordFromJson(Map<String, dynamic> json) => _Chord(
      name: json['name'] as String,
      nameAlt:
          (json['nameAlt'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChordToJson(_Chord instance) => <String, dynamic>{
      'name': instance.name,
      'nameAlt': instance.nameAlt,
    };
