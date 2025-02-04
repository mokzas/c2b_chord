import 'package:c2b/main.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() {
  Logger.root.level = Level.ALL;

  runApp(
    const MainApp(),
  );
}
