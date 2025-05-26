/*
 Design System constant definitions
 */

import 'package:c2b_chord/ui/theme/util.dart';
import 'package:flutter/material.dart';

class C2bPadding {
  static final longSide = 16.0;
  static final shortSide = 24.0;
  static final extraSmall = 4.0;
  static final small = 8.0;
  static final largeContainer = 16.0;
  static final listTitleHorizontal = 8.0;
}

class C2bMargin {
  static final small = 8.0;
  static final large = 16.0;
}

class C2bRadius {
  static final none = 0;
  static final extraSmall = 4.0;
  static final small = 8.0;
  static final medium = 12.0;
  static final large = 16.0;
  static final extraLarge = 28.0;
  static final full = 1000.0;
}

class C2bHeight {
  static final divider = 1.0;
  static final buttonSmall = 40.0;
  static final buttonLarge = 48.0;
  static final playControlButton = 40.0;
  static final bar = 80.0;
  static final barLine = 4.0;
  static final filterChip = 32.0;
}

class C2bWidth {
  static final filterChip = 44.0;
  static final bar = 140.0;
  static final beatIndicator = 8.0;
  static final playControlButton = 32.0;
}

Widget wGap4() => const SizedBox(width: 4.0);
Widget wGap8() => const SizedBox(width: 8.0);
Widget wGap16() => const SizedBox(width: 16.0);
Widget wGap24() => const SizedBox(width: 24.0);

Widget hGap4() => const SizedBox(height: 4.0);
Widget hGap8() => const SizedBox(height: 8.0);
Widget hGap16() => const SizedBox(height: 16.0);
Widget hGap24() => const SizedBox(height: 24.0);

TextTheme? _mainTextTheme;

TextTheme mainTextTheme(BuildContext context) {
  return _mainTextTheme ??= createTextTheme(
    context,
    "Noto Sans KR",
    "Noto Sans KR",
  );
}

TextTheme? _musicTextTheme;

TextTheme musicTextTheme(BuildContext context) {
  return _musicTextTheme ??= createTextTheme(
    context,
    "Noto Music",
    "Noto Music",
  );
}

class CustomColorScheme {
  static final neutral50 = Color(0xFF7A767A);
  static final neutral70 = Color(0xFFAFAAAE);
  static final neutral80 = Color(0xFFCAC5C9);
  static final modalShadow = Color(0x89000000);
}
