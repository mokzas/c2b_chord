/*
 Design System constant definitions
 */

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:c2b_chord/ui/theme/util.dart';

class TokenManager {
  static Map<String, dynamic>? _tokens;

  static Future<void> initialize() async {
    if (_tokens != null) return;

    final String jsonString = await rootBundle.loadString('tokens.json');
    _tokens = json.decode(jsonString)['tokens/global'];
  }

  static double getValue(String category, String key) {
    if (_tokens == null) throw Exception('TokenManager not initialized');
    return (_tokens![category][key]['value'] as num).toDouble();
  }
}

/// Initialize all design tokens at once.
/// This should be called before the app starts.
Future<void> initializeDesignTokens() async {
  await TokenManager.initialize();
  await C2bPadding.initialize();
  await C2bMargin.initialize();
  await C2bRadius.initialize();
  await C2bHeight.initialize();
  await C2bWidth.initialize();
}

class C2bPadding {
  static C2bPadding? _instance;

  final double _longSide;
  final double _shortSide;
  final double _largeContainer;
  final double _listTitleHorizontal;
  final double _extraSmall;
  final double _small;
  final double _medium;
  final double _large;
  final double _extraLarge;

  const C2bPadding._({
    required double longSide,
    required double shortSide,
    required double largeContainer,
    required double listTitleHorizontal,
    required double extraSmall,
    required double small,
    required double medium,
    required double large,
    required double extraLarge,
  }) : _longSide = longSide,
       _shortSide = shortSide,
       _largeContainer = largeContainer,
       _listTitleHorizontal = listTitleHorizontal,
       _extraSmall = extraSmall,
       _small = small,
       _medium = medium,
       _large = large,
       _extraLarge = extraLarge;

  static C2bPadding get instance {
    if (_instance == null) {
      throw Exception('C2bPadding not initialized');
    }
    return _instance!;
  }

  static Future<void> initialize() async {
    await TokenManager.initialize();
    _instance = C2bPadding._(
      longSide: TokenManager.getValue('Padding', 'longSide'),
      shortSide: TokenManager.getValue('Padding', 'shortSide'),
      largeContainer: TokenManager.getValue('Padding', 'largeContainer'),
      listTitleHorizontal: TokenManager.getValue(
        'Padding',
        'listTitleHorizontal',
      ),
      extraSmall: TokenManager.getValue('Padding', 'extraSmall'),
      small: TokenManager.getValue('Padding', 'small'),
      medium: TokenManager.getValue('Padding', 'medium'),
      large: TokenManager.getValue('Padding', 'large'),
      extraLarge: TokenManager.getValue('Padding', 'extraLarge'),
    );
  }

  // Backward compatibility
  static double get longSide => instance._longSide;
  static double get shortSide => instance._shortSide;
  static double get largeContainer => instance._largeContainer;
  static double get listTitleHorizontal => instance._listTitleHorizontal;
  static double get extraSmall => instance._extraSmall;
  static double get small => instance._small;
  static double get medium => instance._medium;
  static double get large => instance._large;
  static double get extraLarge => instance._extraLarge;
}

class C2bMargin {
  static C2bMargin? _instance;

  final double _extraSmall;
  final double _small;
  final double _medium;
  final double _large;
  final double _extraLarge;

  const C2bMargin._({
    required double extraSmall,
    required double small,
    required double medium,
    required double large,
    required double extraLarge,
  }) : _extraSmall = extraSmall,
       _small = small,
       _medium = medium,
       _large = large,
       _extraLarge = extraLarge;

  static C2bMargin get instance {
    if (_instance == null) {
      throw Exception('C2bMargin not initialized');
    }
    return _instance!;
  }

  static Future<void> initialize() async {
    await TokenManager.initialize();
    _instance = C2bMargin._(
      extraSmall: TokenManager.getValue('Margin', 'extraSmall'),
      small: TokenManager.getValue('Margin', 'small'),
      medium: TokenManager.getValue('Margin', 'medium'),
      large: TokenManager.getValue('Margin', 'large'),
      extraLarge: TokenManager.getValue('Margin', 'extraLarge'),
    );
  }

  // Backward compatibility
  static double get extraSmall => instance._extraSmall;
  static double get small => instance._small;
  static double get medium => instance._medium;
  static double get large => instance._large;
  static double get extraLarge => instance._extraLarge;
}

class C2bRadius {
  static C2bRadius? _instance;

  final double _none;
  final double _extraSmall;
  final double _small;
  final double _medium;
  final double _large;
  final double _extraLarge;
  final double _full;

  const C2bRadius._({
    required double none,
    required double extraSmall,
    required double small,
    required double medium,
    required double large,
    required double extraLarge,
    required double full,
  }) : _none = none,
       _extraSmall = extraSmall,
       _small = small,
       _medium = medium,
       _large = large,
       _extraLarge = extraLarge,
       _full = full;

  static C2bRadius get instance {
    if (_instance == null) {
      throw Exception('C2bRadius not initialized');
    }
    return _instance!;
  }

  static Future<void> initialize() async {
    await TokenManager.initialize();
    _instance = C2bRadius._(
      none: TokenManager.getValue('Radius', 'none'),
      extraSmall: TokenManager.getValue('Radius', 'extraSmall'),
      small: TokenManager.getValue('Radius', 'small'),
      medium: TokenManager.getValue('Radius', 'medium'),
      large: TokenManager.getValue('Radius', 'large'),
      extraLarge: TokenManager.getValue('Radius', 'extraLarge'),
      full: TokenManager.getValue('Radius', 'full'),
    );
  }

  // Backward compatibility
  static double get none => instance._none;
  static double get extraSmall => instance._extraSmall;
  static double get small => instance._small;
  static double get medium => instance._medium;
  static double get large => instance._large;
  static double get extraLarge => instance._extraLarge;
  static double get full => instance._full;
}

class C2bHeight {
  static C2bHeight? _instance;

  final double _divider;
  final double _buttonSmall;
  final double _buttonLarge;
  final double _playControlButton;
  final double _bar;
  final double _barLine;
  final double _filterChipMin;

  const C2bHeight._({
    required double divider,
    required double buttonSmall,
    required double buttonLarge,
    required double playControlButton,
    required double bar,
    required double barLine,
    required double filterChipMin,
  }) : _divider = divider,
       _buttonSmall = buttonSmall,
       _buttonLarge = buttonLarge,
       _playControlButton = playControlButton,
       _bar = bar,
       _barLine = barLine,
       _filterChipMin = filterChipMin;

  static C2bHeight get instance {
    if (_instance == null) {
      throw Exception('C2bHeight not initialized');
    }
    return _instance!;
  }

  static Future<void> initialize() async {
    await TokenManager.initialize();
    _instance = C2bHeight._(
      divider: TokenManager.getValue('Height', 'divider'),
      buttonSmall: TokenManager.getValue('Height', 'buttonSmall'),
      buttonLarge: TokenManager.getValue('Height', 'buttonLarge'),
      playControlButton: TokenManager.getValue('Height', 'playControlButton'),
      bar: TokenManager.getValue('Height', 'bar'),
      barLine: TokenManager.getValue('Height', 'barLine'),
      filterChipMin: TokenManager.getValue('Height', 'filterChipMin'),
    );
  }

  // Backward compatibility
  static double get divider => instance._divider;
  static double get buttonSmall => instance._buttonSmall;
  static double get buttonLarge => instance._buttonLarge;
  static double get playControlButton => instance._playControlButton;
  static double get bar => instance._bar;
  static double get barLine => instance._barLine;
  static double get filterChipMin => instance._filterChipMin;
}

class C2bWidth {
  static C2bWidth? _instance;

  final double _buttonSmallMin;
  final double _buttonLargeMin;
  final double _playControlButton;
  final double _barMin;
  final double _filterChipMin;
  final double _beatIndicator;

  const C2bWidth._({
    required double buttonSmallMin,
    required double buttonLargeMin,
    required double playControlButton,
    required double barMin,
    required double filterChipMin,
    required double beatIndicator,
  }) : _buttonSmallMin = buttonSmallMin,
       _buttonLargeMin = buttonLargeMin,
       _playControlButton = playControlButton,
       _barMin = barMin,
       _filterChipMin = filterChipMin,
       _beatIndicator = beatIndicator;

  static C2bWidth get instance {
    if (_instance == null) {
      throw Exception('C2bWidth not initialized');
    }
    return _instance!;
  }

  static Future<void> initialize() async {
    await TokenManager.initialize();
    _instance = C2bWidth._(
      buttonSmallMin: TokenManager.getValue('Width', 'buttonSmallMin'),
      buttonLargeMin: TokenManager.getValue('Width', 'buttonLargeMin'),
      playControlButton: TokenManager.getValue('Width', 'playControlButton'),
      barMin: TokenManager.getValue('Width', 'barMin'),
      filterChipMin: TokenManager.getValue('Width', 'filterChipMin'),
      beatIndicator: TokenManager.getValue('Width', 'beatIndicator'),
    );
  }

  // Backward compatibility
  static double get buttonSmallMin => instance._buttonSmallMin;
  static double get buttonLargeMin => instance._buttonLargeMin;
  static double get playControlButton => instance._playControlButton;
  static double get barMin => instance._barMin;
  static double get filterChipMin => instance._filterChipMin;
  static double get beatIndicator => instance._beatIndicator;
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

// Material Theme Builder에서 Color Palette는 생성해주지 않기 떄문에
// Color Scale 중 UI 컬러로 쓰인 색상 직접 정의
class CustomColorScheme {
  static final neutral50 = Color(0xFF7A767A);
  static final neutral70 = Color(0xFFAFAAAE);
  static final neutral80 = Color(0xFFCAC5C9);
  static final modalShadow = Color(0x89000000);
}
