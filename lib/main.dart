import 'package:c2b_chord/main_development.dart' as development;
import 'package:c2b_chord/repository/analytics_repository.dart';
import 'package:c2b_chord/repository/device_info_repository.dart';
import 'package:c2b_chord/routing/router.dart';
import 'package:c2b_chord/ui/theme/theme.dart';
import 'package:c2b_chord/ui/theme/util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 기본은 세로 화면 UI
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Launch development config by default

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AnalyticsRepository.setUser(await DeviceInfoRepository.deviceId());

  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(
      context,
      "Noto Sans KR",
      "Noto Sans KR",
    );
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      routerConfig: router(),
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
    );
  }
}
