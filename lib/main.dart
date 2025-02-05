import 'package:c2b/main_development.dart' as development;
import 'package:c2b/routing/router.dart';
import 'package:flutter/material.dart';

void main() {
  // Launch development config by default
  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router(),
    );
  }
}
