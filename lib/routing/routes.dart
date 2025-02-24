import 'package:c2b/ui/screens/chord_select_screen.dart';
import 'package:c2b/ui/screens/play_screen.dart';

abstract final class Routes {
  static const home = '/';
  static const signIn = '${home}signIn';
  static const signUp = '${home}signUp';
  static const signUpSucceed = '$signUp/signUpSucceed';
  static const survey = '$signUpSucceed/survey';
  static const chordSelect = '$home${ChordSelectScreen.name}';
  static const play = '$chordSelect/${PlayScreen.name}';
  static const setting = '${home}setting';
  // static const booking = '/$bookingRelative';
  // static const bookingRelative = 'booking';
  // static String bookingWithId(int id) => '$booking/$id';
}
