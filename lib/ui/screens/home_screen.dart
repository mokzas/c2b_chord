import 'package:c2b_chord/repository/analytics_repository.dart';
import 'package:c2b_chord/routing/routes.dart';
import 'package:c2b_chord/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const name = 'home';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with RouteAware {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    AnalyticsService.observer.subscribe(
      this,
      ModalRoute.of(context)! as PageRoute,
    );
  }

  @override
  void dispose() {
    AnalyticsService.observer.unsubscribe(this);
    super.dispose();
  }

  // @override
  // void didPush() {
  //   super.didPush();
  // }
  //
  // @override
  // void didPop() {
  //   super.didPop();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: C2bPadding.shortSide,
            horizontal: C2bPadding.longSide,
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
