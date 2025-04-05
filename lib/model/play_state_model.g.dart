// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayStateModel _$PlayStateModelFromJson(Map<String, dynamic> json) =>
    _PlayStateModel(
      isPlaying: json['isPlaying'] as bool? ?? false,
      isFirstTickPlayed: json['isFirstTickPlayed'] as bool? ?? false,
      bpm: (json['bpm'] as num?)?.toInt() ?? 120,
      volume: (json['volume'] as num?)?.toInt() ?? 50,
      timeSignature: (json['timeSignature'] as num?)?.toInt() ?? 4,
      currentTick: (json['currentTick'] as num?)?.toInt() ?? 0,
      displayChordCount: (json['displayChordCount'] as num?)?.toInt() ?? 8,
      currentChordIndex: (json['currentChordIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PlayStateModelToJson(_PlayStateModel instance) =>
    <String, dynamic>{
      'isPlaying': instance.isPlaying,
      'isFirstTickPlayed': instance.isFirstTickPlayed,
      'bpm': instance.bpm,
      'volume': instance.volume,
      'timeSignature': instance.timeSignature,
      'currentTick': instance.currentTick,
      'displayChordCount': instance.displayChordCount,
      'currentChordIndex': instance.currentChordIndex,
    };
