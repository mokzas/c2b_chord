import 'package:c2b/routing/routes.dart';
import 'package:c2b/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // 가로모드 고정
    SystemChrome.setPreferredOrientations([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: GridMargin.shortSide,
            horizontal: GridMargin.longSide,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () {
                  // context.go 사용 시 orientation이 전환되지 않는 문제가 있음.
                  context.push(Routes.chordSelect);
                },
                child: Text('Go To Play'),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
