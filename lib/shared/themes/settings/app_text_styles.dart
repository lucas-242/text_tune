import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_tune/shared/themes/settings/app_colors.dart';

abstract class AppTextStyles {
  /// 32px, [AppColors.darkGrey], [FontWeight.w700]
  static final headlineLg = textTheme.headlineLarge!;

  /// 24px, [AppColors.darkGrey], [FontWeight.w700]
  static final headlineMd = textTheme.headlineMedium!;

  /// 18px, [AppColors.darkGrey], [FontWeight.w700]
  static final headlineSm = textTheme.headlineSmall!;

  /// 24px, [AppColors.darkGrey], [FontWeight.w500]
  static final titleLg = textTheme.titleLarge!;

  /// 20px, [AppColors.darkGrey], [FontWeight.w500]
  static final titleMd = textTheme.titleMedium!;

  /// 16px, [AppColors.darkGrey], [FontWeight.w500]
  static final titleSm = textTheme.titleSmall!;

  /// 18px, [AppColors.darkGrey], [FontWeight.w400]
  static final lg = textTheme.bodyLarge!;

  /// 16px, [AppColors.darkGrey], [FontWeight.w400]
  static final md = textTheme.bodyMedium!;

  /// 14px, [AppColors.darkGrey], [FontWeight.w400]
  static final sm = textTheme.bodySmall!;

  /// 16px, [AppColors.grey], [FontWeight.w400]
  static final labelLg = textTheme.labelLarge!;

  /// 14px, [AppColors.grey], [FontWeight.w400]
  static final labelMd = textTheme.labelMedium!;

  /// 12px, [AppColors.grey], [FontWeight.w400]
  static final labelSm = textTheme.labelSmall!;

  static final textTheme = TextTheme(
    displayLarge: GoogleFonts.outfit(),
    displayMedium: GoogleFonts.outfit(),
    displaySmall: GoogleFonts.outfit(),
    headlineLarge: GoogleFonts.outfit(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w700,
      fontSize: 32,
    ),
    headlineMedium: GoogleFonts.outfit(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    headlineSmall: GoogleFonts.outfit(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),
    titleLarge: GoogleFonts.outfit(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w500,
      fontSize: 24,
    ),
    titleMedium: GoogleFonts.outfit(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    titleSmall: GoogleFonts.outfit(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    bodyLarge: GoogleFonts.outfit(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    bodyMedium: GoogleFonts.outfit(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodySmall: GoogleFonts.outfit(
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelLarge: GoogleFonts.outfit(
      color: AppColors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    labelMedium: GoogleFonts.outfit(
      color: AppColors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelSmall: GoogleFonts.outfit(
      color: AppColors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}
