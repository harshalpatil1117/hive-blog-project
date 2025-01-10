part of 'theme.dart';

abstract class _HiveColors {
  static const Color indigo = Color(0xff33009A);
  static const Color blueGrey = Color(0xffE4E6F2);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);

  static const Color successGreen = Color(0xff0CCA6F);
  static const Color red = Color(0xffDB0F27);

  static const Color background = Color(0xfff5f5f5);

  static const Color border = Color(0xffD9D9D9);
  static const Color divider = Color(0xffB3B3B3);
  static const Color transparent = Color(0x00000000);

}

const _colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _HiveColors.white,
  onPrimary: _HiveColors.white,
  secondary: _HiveColors.blueGrey,
  onSecondary: _HiveColors.white,
  tertiaryContainer: _HiveColors.background,
  onTertiaryContainer: _HiveColors.background,
  error: _HiveColors.red,
  onError: _HiveColors.white,
  background: _HiveColors.white,
  onBackground: _HiveColors.black,
  surface: _HiveColors.white,
  onSurface: _HiveColors.black,
);
