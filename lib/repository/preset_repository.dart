import 'dart:convert';
import 'dart:io';
import 'package:c2b_chord/model/chord_model.dart';
import 'package:c2b_chord/model/preset_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class PresetRepository {
  /// 사용자 프리셋 폴더 경로
  static const String userPresetPath = 'User';

  /// 사용자 프리셋 생성 헬퍼 메서드
  static PresetModel createPreset({
    required String name,
    required List<ChordModel> chordList,
  }) {
    return PresetModel(
      id: Uuid().v4(),
      name: name,
      type: PresetType.user,
      path: userPresetPath,
      chordList: chordList,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// 앱 문서 디렉토리 내 presets 폴더 경로를 반환
  static Future<Directory> _getPresetsDirectory() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final presetsDir = Directory(path.join(appDocDir.path, 'presets'));

    // presets 폴더가 없으면 생성
    if (!await presetsDir.exists()) {
      await presetsDir.create(recursive: true);
    }

    return presetsDir;
  }

  /// 사용자 커스텀 프리셋을 JSON 파일로 저장하는 함수
  ///
  /// [preset] 저장할 프리셋 모델
  ///
  static Future<void> saveUserPreset(PresetModel preset) async {
    try {
      assert(preset.path.isNotEmpty, 'folderPath is empty');
      assert(
        preset.type == PresetType.user,
        "Preset can't be saved in builtin folder",
      );

      final presetsDir = await _getPresetsDirectory();
      final userPresetDir = Directory(
        path.join(presetsDir.path, userPresetPath),
      );

      // 폴더가 없으면 생성
      if (!await userPresetDir.exists()) {
        await userPresetDir.create(recursive: true);
      }

      // 프리셋 파일명 생성 (id.json)
      final fileName = '${preset.id}.json';
      final filePath = path.join(userPresetDir.path, fileName);
      final file = File(filePath);

      // PresetModel을 JSON으로 변환하여 저장
      final jsonString = jsonEncode(preset.toJson());
      await file.writeAsString(jsonString);
    } catch (e) {
      rethrow;
    }
  }

  /// 사용자가 저장한 프리셋들을 로드 (User 폴더에서만)
  static Future<List<PresetModel>> loadUserPresets() async {
    try {
      final presetsDir = await _getPresetsDirectory();
      final userPresetDir = Directory(
        path.join(presetsDir.path, userPresetPath),
      );

      // User 폴더가 없으면 빈 리스트 반환
      if (!await userPresetDir.exists()) {
        return [];
      }

      // User 폴더에서만 JSON 파일 찾기
      final userFiles =
          await userPresetDir
              .list(recursive: true)
              .where(
                (entity) => entity is File && entity.path.endsWith('.json'),
              )
              .cast<File>()
              .toList();

      final List<PresetModel> userPresets = [];

      for (final file in userFiles) {
        try {
          final jsonString = await file.readAsString();
          final json = jsonDecode(jsonString);
          final preset = PresetModel.fromJson(json);
          userPresets.add(preset);
        } catch (e) {
          // 개별 파일 로드 실패 시 스킵
        }
      }

      return userPresets;
    } catch (e) {
      return [];
    }
  }

  /// builtin 프리셋들을 로드하는 함수
  ///
  /// assets/presets/builtin_presets.json 파일에서 로드
  ///
  static Future<List<PresetModel>> loadBuiltinPresets() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/presets/builtin_presets.json',
      );
      final json = jsonDecode(jsonString);
      final presetsJson = json['presets'] as List;

      return presetsJson
          .map((presetJson) => PresetModel.fromJson(presetJson))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// 사용자 프리셋을 삭제하는 함수
  ///
  /// [presetId] 삭제할 프리셋의 ID
  ///
  static Future<bool> deleteUserPreset(String presetId) async {
    try {
      final presetsDir = await _getPresetsDirectory();
      final userPresetDir = Directory(
        path.join(presetsDir.path, userPresetPath),
      );

      // User 폴더가 없으면 삭제할 프리셋이 없음
      if (!await userPresetDir.exists()) {
        return false;
      }

      // 프리셋 파일명 생성 (id.json)
      final fileName = '$presetId.json';
      final filePath = path.join(userPresetDir.path, fileName);
      final file = File(filePath);

      // 파일이 존재하면 삭제
      if (await file.exists()) {
        await file.delete();
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
