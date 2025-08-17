import 'package:flutter/material.dart';
import 'package:text_tune/shared/themes/settings/app_breakpoints.dart';

extension ThemeExtension on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);
  ThemeData get _theme => Theme.of(this);
  ColorScheme get colorsScheme => _theme.colorScheme;

  double get width => _mediaQuery.size.width;
  double get height => _mediaQuery.size.height;

  /// Returns T according to the screen size.
  ///
  /// If the screen size is not provided,
  /// it will use the next lowest screen size provided.
  T whenScreenSize<T>({
    T? xxxLg,
    T? xxLg,
    T? xLg,
    T? lg,
    T? md,
    T? sm,
    required T xs,
  }) {
    switch (width) {
      case >= AppBreakpoints.xxxLg:
        return xxxLg ?? xxLg ?? xLg ?? lg ?? md ?? sm ?? xs;
      case >= AppBreakpoints.xxLg:
        return xxLg ?? xLg ?? lg ?? md ?? sm ?? xs;
      case >= AppBreakpoints.xLg:
        return xLg ?? lg ?? md ?? sm ?? xs;
      case >= AppBreakpoints.lg:
        return lg ?? md ?? sm ?? xs;
      case >= AppBreakpoints.md:
        return md ?? sm ?? xs;
      case >= AppBreakpoints.sm:
        return sm ?? xs;
      default:
        return xs;
    }
  }
}
