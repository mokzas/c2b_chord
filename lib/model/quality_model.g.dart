// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QualityModel _$QualityModelFromJson(Map<String, dynamic> json) =>
    _QualityModel(
      name: json['name'] as String,
      aliases:
          (json['aliases'] as List<dynamic>).map((e) => e as String).toList(),
      intervals: (json['intervals'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      notation:
          (json['notation'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$QualityModelToJson(_QualityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'aliases': instance.aliases,
      'intervals': instance.intervals,
      'notation': instance.notation,
    };
