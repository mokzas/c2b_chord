import 'package:c2b_chord/main_development.dart' as development;
import 'package:c2b_chord/repository/analytics_repository.dart';
import 'package:c2b_chord/routing/router.dart';
import 'package:c2b_chord/ui/theme/tokens.dart';
import 'package:c2b_chord/ui/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize design tokens
  await initializeDesignTokens();

  // 기본은 세로 화면 UI
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Launch development config by default

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AnalyticsRepository.offAnalytics();
  // AnalyticsRepository.setUser(await DeviceInfoRepository.deviceId());

  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    final textTheme = mainTextTheme(context);
    final theme = MaterialTheme(textTheme);

    return MaterialApp.router(routerConfig: router(), theme: theme.light());
  }
}
