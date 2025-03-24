import 'dart:convert';

import 'package:c2b/model/quality_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quality_provider.g.dart';

// Riverpod FutureVariable - State를 keep 하고 있지 않은 형태
// Function to load chord qualities from JSON
// 요청할 때마다 아래 루틴을 실행하여 quality를 돌려주는 provider.
// 아래는 명세와 같은 것. build_runner를 호출하면 provider 코드를 생성함
@riverpod
Future<List<QualityModel>> quality(Ref ref) async {
  String qualityJsonStr = await rootBundle.loadString('assets/chord_qualities.json');
  List<dynamic> qualityJson = json.decode(qualityJsonStr);

  return qualityJson.map((e) {
    return QualityModel.fromJson(e);
  }).toList();
}