import 'package:flutter/material.dart';
import 'package:text_tune/shared/themes/themes.dart';

abstract class AppTheme {
  static const pageTransitionsTheme = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
    },
  );

  static ShapeBorder get defaultShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColors.stroke),
      );

  static ThemeData light() {
    final colors = _getColorScheme(Brightness.light);

    return ThemeData.light().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: colors,
      appBarTheme: _appBarTheme(colors),
      cardTheme: _cardTheme(),
      listTileTheme: _listTileTheme(colors),
      bottomAppBarTheme: _bottomAppBarTheme(colors),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colors),
      bottomSheetTheme: _bottomSheetTheme(colors),
      floatingActionButtonTheme: _floatingActionButtonTheme(colors),
      outlinedButtonTheme: _outlinedButtonTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
      dividerTheme: _dividerTheme(colors),
      navigationRailTheme: _navigationRailTheme(colors),
      tabBarTheme: _tabBarTheme(colors),
      drawerTheme: _drawerTheme(colors),
      inputDecorationTheme: _inputDecorationTheme(colors),
      dataTableTheme: _dataTableTheme(),
      chipTheme: _choiceChipTheme(),
      textTheme: AppTextStyles.textTheme,
      scaffoldBackgroundColor: colors.surface,
    );
  }

  static ColorScheme _getColorScheme(Brightness brightness) =>
      ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: AppColors.greenDark,
        primary: AppColors.greenDark,
        surface: AppColors.background,
        onSurface: AppColors.textLight,
        onPrimary: AppColors.white,
        outline: AppColors.stroke,
        error: AppColors.error,
      );

  static CardThemeData _cardTheme() => CardThemeData(
        elevation: 1,
        shape: defaultShape,
        margin: const EdgeInsets.only(bottom: AppInsets.sm),
        color: AppColors.white,
        clipBehavior: Clip.antiAlias,
      );

  static ListTileThemeData _listTileTheme(ColorScheme colors) =>
      ListTileThemeData(selectedColor: colors.secondary);

  static AppBarTheme _appBarTheme(ColorScheme colors) => AppBarTheme(
        elevation: 1,
        shadowColor: Colors.black.withAlpha(100),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        foregroundColor: AppColors.textLight,
        titleTextStyle: AppTextStyles.headlineLg,
      );

  static TabBarThemeData _tabBarTheme(ColorScheme colors) => TabBarThemeData(
        labelColor: colors.secondary,
        unselectedLabelColor: colors.onSurfaceVariant,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colors.secondary,
              width: 2,
            ),
          ),
        ),
      );

  static BottomAppBarThemeData _bottomAppBarTheme(ColorScheme colors) =>
      BottomAppBarThemeData(
        color: colors.surface,
        elevation: 0,
        height: 75,
      );

  static BottomNavigationBarThemeData _bottomNavigationBarTheme(
    ColorScheme colors,
  ) =>
      BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.surface,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.onPrimaryContainer,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      );

  static BottomSheetThemeData _bottomSheetTheme(ColorScheme colors) =>
      BottomSheetThemeData(
        backgroundColor: colors.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
      );

  static FloatingActionButtonThemeData _floatingActionButtonTheme(
    ColorScheme colors,
  ) =>
      FloatingActionButtonThemeData(
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: colors.primary,
        foregroundColor: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonTheme() =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.stroke),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppInsets.sm),
          ),
        ),
      );

  static ElevatedButtonThemeData _elevatedButtonTheme() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppInsets.sm),
          ),
        ),
      );

  static DividerThemeData _dividerTheme(ColorScheme colors) =>
      const DividerThemeData(
        color: AppColors.stroke,
        thickness: 1,
        indent: 0,
        endIndent: 0,
        space: 0,
      );

  static NavigationRailThemeData _navigationRailTheme(ColorScheme colors) =>
      const NavigationRailThemeData();

  static DrawerThemeData _drawerTheme(ColorScheme colors) => DrawerThemeData(
        backgroundColor: colors.surface,
      );

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colors) {
    const borderRadius = BorderRadius.all(Radius.circular(AppInsets.xs));
    return InputDecorationTheme(
      labelStyle: AppTextStyles.labelLg,
      hintStyle: AppTextStyles.labelLg,
      iconColor: AppColors.stroke,
      prefixIconColor: AppColors.stroke,
      suffixIconColor: AppColors.stroke,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: colors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppInsets.md),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colors.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colors.outline),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colors.outline),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colors.outline),
      ),
    );
  }

  static DataTableThemeData _dataTableTheme() => DataTableThemeData(
        headingRowHeight: 42,
        dataRowMaxHeight: 42,
        dataRowMinHeight: 28,
        horizontalMargin: AppInsets.md,
        columnSpacing: AppInsets.md,
        headingTextStyle: AppTextStyles.titleSm,
        dataTextStyle: AppTextStyles.md,
      );

  static ChipThemeData _choiceChipTheme() => ChipThemeData(
        showCheckmark: false,
        padding: const EdgeInsets.all(AppInsets.sm),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        selectedColor: AppColors.greenDark.withAlpha(130),
        labelStyle: AppTextStyles.md,
        secondaryLabelStyle: AppTextStyles.titleSm, //selected
        side: const BorderSide(color: AppColors.stroke),
      );
}
