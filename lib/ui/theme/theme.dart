import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff05677e),
      surfaceTint: Color(0xff05677e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb6ebff),
      onPrimaryContainer: Color(0xff004e60),
      secondary: Color(0xff4c626a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcfe6f0),
      onSecondaryContainer: Color(0xff344a52),
      tertiary: Color(0xff5a5c7e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe0e0ff),
      onTertiaryContainer: Color(0xff424465),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff5fafd),
      onSurface: Color(0xff171c1f),
      onSurfaceVariant: Color(0xff40484c),
      outline: Color(0xff70787c),
      outlineVariant: Color(0xffbfc8cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xff87d1eb),
      primaryFixed: Color(0xffb6ebff),
      onPrimaryFixed: Color(0xff001f28),
      primaryFixedDim: Color(0xff87d1eb),
      onPrimaryFixedVariant: Color(0xff004e60),
      secondaryFixed: Color(0xffcfe6f0),
      onSecondaryFixed: Color(0xff071e26),
      secondaryFixedDim: Color(0xffb3cad4),
      onSecondaryFixedVariant: Color(0xff344a52),
      tertiaryFixed: Color(0xffe0e0ff),
      onTertiaryFixed: Color(0xff161937),
      tertiaryFixedDim: Color(0xffc2c3eb),
      onTertiaryFixedVariant: Color(0xff424465),
      surfaceDim: Color(0xffd6dbde),
      surfaceBright: Color(0xfff5fafd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff4f7),
      surfaceContainer: Color(0xffeaeff1),
      surfaceContainerHigh: Color(0xffe4e9ec),
      surfaceContainerHighest: Color(0xffdee3e6),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003c4a),
      surfaceTint: Color(0xff05677e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff23768e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff233941),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5a7079),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff313353),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff686a8d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafd),
      onSurface: Color(0xff0d1214),
      onSurfaceVariant: Color(0xff2f373b),
      outline: Color(0xff4b5457),
      outlineVariant: Color(0xff666e72),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xff87d1eb),
      primaryFixed: Color(0xff23768e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005d72),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5a7079),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff425860),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff686a8d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff505274),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c7ca),
      surfaceBright: Color(0xfff5fafd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff4f7),
      surfaceContainer: Color(0xffe4e9ec),
      surfaceContainerHigh: Color(0xffd9dee0),
      surfaceContainerHighest: Color(0xffcdd2d5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00313d),
      surfaceTint: Color(0xff05677e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005063),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff192f37),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff374c55),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff272948),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff444667),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafd),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff252d31),
      outlineVariant: Color(0xff424a4e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xff87d1eb),
      primaryFixed: Color(0xff005063),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003846),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff374c55),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff20363d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff444667),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2e304f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4b9bc),
      surfaceBright: Color(0xfff5fafd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf1f4),
      surfaceContainer: Color(0xffdee3e6),
      surfaceContainerHigh: Color(0xffd0d5d8),
      surfaceContainerHighest: Color(0xffc2c7ca),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff87d1eb),
      surfaceTint: Color(0xff87d1eb),
      onPrimary: Color(0xff003543),
      primaryContainer: Color(0xff004e60),
      onPrimaryContainer: Color(0xffb6ebff),
      secondary: Color(0xffb3cad4),
      onSecondary: Color(0xff1e333b),
      secondaryContainer: Color(0xff344a52),
      onSecondaryContainer: Color(0xffcfe6f0),
      tertiary: Color(0xffc2c3eb),
      onTertiary: Color(0xff2b2e4d),
      tertiaryContainer: Color(0xff424465),
      onTertiaryContainer: Color(0xffe0e0ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1416),
      onSurface: Color(0xffdee3e6),
      onSurfaceVariant: Color(0xffbfc8cc),
      outline: Color(0xff8a9296),
      outlineVariant: Color(0xff40484c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e6),
      inversePrimary: Color(0xff05677e),
      primaryFixed: Color(0xffb6ebff),
      onPrimaryFixed: Color(0xff001f28),
      primaryFixedDim: Color(0xff87d1eb),
      onPrimaryFixedVariant: Color(0xff004e60),
      secondaryFixed: Color(0xffcfe6f0),
      onSecondaryFixed: Color(0xff071e26),
      secondaryFixedDim: Color(0xffb3cad4),
      onSecondaryFixedVariant: Color(0xff344a52),
      tertiaryFixed: Color(0xffe0e0ff),
      onTertiaryFixed: Color(0xff161937),
      tertiaryFixedDim: Color(0xffc2c3eb),
      onTertiaryFixedVariant: Color(0xff424465),
      surfaceDim: Color(0xff0f1416),
      surfaceBright: Color(0xff353a3c),
      surfaceContainerLowest: Color(0xff0a0f11),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff252b2d),
      surfaceContainerHighest: Color(0xff303638),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa3e6ff),
      surfaceTint: Color(0xff87d1eb),
      onPrimary: Color(0xff002a35),
      primaryContainer: Color(0xff4f9ab3),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc9e0ea),
      onSecondary: Color(0xff122930),
      secondaryContainer: Color(0xff7e949e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffd9d9ff),
      onTertiary: Color(0xff212341),
      tertiaryContainer: Color(0xff8c8eb3),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1416),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd5dee2),
      outline: Color(0xffabb3b7),
      outlineVariant: Color(0xff899296),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e6),
      inversePrimary: Color(0xff004f62),
      primaryFixed: Color(0xffb6ebff),
      onPrimaryFixed: Color(0xff00141a),
      primaryFixedDim: Color(0xff87d1eb),
      onPrimaryFixedVariant: Color(0xff003c4a),
      secondaryFixed: Color(0xffcfe6f0),
      onSecondaryFixed: Color(0xff00141a),
      secondaryFixedDim: Color(0xffb3cad4),
      onSecondaryFixedVariant: Color(0xff233941),
      tertiaryFixed: Color(0xffe0e0ff),
      onTertiaryFixed: Color(0xff0c0e2c),
      tertiaryFixedDim: Color(0xffc2c3eb),
      onTertiaryFixedVariant: Color(0xff313353),
      surfaceDim: Color(0xff0f1416),
      surfaceBright: Color(0xff404548),
      surfaceContainerLowest: Color(0xff04080a),
      surfaceContainerLow: Color(0xff191e21),
      surfaceContainer: Color(0xff23292b),
      surfaceContainerHigh: Color(0xff2e3336),
      surfaceContainerHighest: Color(0xff393e41),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffdbf4ff),
      surfaceTint: Color(0xff87d1eb),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff83cde7),
      onPrimaryContainer: Color(0xff000d13),
      secondary: Color(0xffdcf4fe),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffafc6d0),
      onSecondaryContainer: Color(0xff000d13),
      tertiary: Color(0xfff0eeff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffbebfe7),
      onTertiaryContainer: Color(0xff060826),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0f1416),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe9f1f6),
      outlineVariant: Color(0xffbbc4c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e6),
      inversePrimary: Color(0xff004f62),
      primaryFixed: Color(0xffb6ebff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff87d1eb),
      onPrimaryFixedVariant: Color(0xff00141a),
      secondaryFixed: Color(0xffcfe6f0),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb3cad4),
      onSecondaryFixedVariant: Color(0xff00141a),
      tertiaryFixed: Color(0xffe0e0ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc2c3eb),
      onTertiaryFixedVariant: Color(0xff0c0e2c),
      surfaceDim: Color(0xff0f1416),
      surfaceBright: Color(0xff4b5153),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2023),
      surfaceContainer: Color(0xff2c3134),
      surfaceContainerHigh: Color(0xff373c3f),
      surfaceContainerHighest: Color(0xff42484a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
