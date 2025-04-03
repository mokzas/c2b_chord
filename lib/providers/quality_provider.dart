import 'dart:convert';

import 'package:c2b/model/quality_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quality_provider.g.dart';

/// JSON 파일로부터 chord quality 정보를 가져오는 Provider
@riverpod
Future<List<QualityModel>> quality(Ref ref) async {
  String qualityJsonStr = await rootBundle.loadString('assets/chord_qualities.json');
  List<dynamic> qualityJson = json.decode(qualityJsonStr);

  return qualityJson.map((e) {
    return QualityModel.fromJson(e);
  }).toList();
}