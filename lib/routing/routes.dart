abstract final class Routes {
  static const home = '/dashboard';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const signUpSucceed = '$signUp/signUpSucceed';
  static const survey = '$signUpSucceed/survey';
  static const training = '/training';
  static const chordSelect = '$training/chordSelect';
  static const play = '$chordSelect/play';
  static const setting = '/setting';
  // static const booking = '/$bookingRelative';
  // static const bookingRelative = 'booking';
  // static String bookingWithId(int id) => '$booking/$id';
}
