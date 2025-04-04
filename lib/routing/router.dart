import 'package:c2b/routing/routes.dart';
import 'package:c2b/ui/screens/chord_select/chord_select_screen.dart';
import 'package:c2b/ui/screens/home_screen.dart';
import 'package:c2b/ui/screens/play/play_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router() => GoRouter(
      initialLocation: Routes.home, // 임시처리
      routes: [
        GoRoute(
          path: Routes.home,
          name: HomeScreen.name,
          builder: (context, state) {
            return HomeScreen();
          },
          routes: [
            GoRoute(
              path: ChordSelectScreen.name,
              name: ChordSelectScreen.name,
              builder: (context, state) {
                return ChordSelectScreen();
              },
              routes: [
                GoRoute(
                  path: PlayScreen.name,
                  name: PlayScreen.name,
                  builder: (context, state) {
                    return PlayScreen();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );

/**
 * Top-level routing redirection definition
 * 앱 전체 영역에서 auth changed 등의 event에 따른 redirection을 세팅하고 싶을 때 설정하는 함수
 * 초기 구현에서는 로그인 없이 앱의 코어 기능들을 사용하도록 설계하였기에, 사용하지 않도록 한다
    Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    final signedIn = false;
    final signingIn = state.matchedLocation == Routes.signIn;

    if (!signedIn) {
    return Routes.signIn;
    }

    if (signingIn) {
    return Routes.home;
    }

    return null;
    }
 **/
