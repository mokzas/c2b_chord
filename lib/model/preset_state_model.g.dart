// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresetStateModel _$PresetStateModelFromJson(Map<String, dynamic> json) =>
    _PresetStateModel(
      presets:
          (json['presets'] as List<dynamic>?)
              ?.map((e) => PresetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$PresetStateModelToJson(_PresetStateModel instance) =>
    <String, dynamic>{
      'presets': instance.presets,
      'isLoading': instance.isLoading,
      'error': instance.error,
    };
