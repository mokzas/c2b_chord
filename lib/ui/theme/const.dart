/*
 Design System constant definitions
 */

import 'package:flutter/material.dart';

class GridMargin {
  static final longSide = 16.0;
  static final shortSide = 24.0;
}

class RadiusValue {
  static final none = 0;
  static final extraSmall = 4.0;
  static final small = 8.0;
  static final medium = 12.0;
  static final large = 16.0;
  static final extraLarge = 28.0;
  static final full = 1000.0;
}

Widget wGap4() => const SizedBox(width: 4.0);
Widget wGap8() => const SizedBox(width: 8.0);
Widget wGap16() => const SizedBox(width: 16.0);
Widget wGap24() => const SizedBox(width: 24.0);

Widget hGap4() => const SizedBox(height: 4.0);
Widget hGap8() => const SizedBox(height: 8.0);
Widget hGap16() => const SizedBox(height: 16.0);
Widget hGap24() => const SizedBox(height: 24.0);
