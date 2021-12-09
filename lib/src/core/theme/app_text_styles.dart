import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

abstract class AppTextStyle {
  TextStyle get label;
  TextStyle get input;
  TextStyle get hint;
  TextStyle get buttonTextStyleColor;
  TextStyle get buttonBoldTextColor;
  TextStyle get buttonTextColor;
  TextStyle get title;
  TextStyle get subTitle;
}

class AppTextStyleImpl implements AppTextStyle {
  @override
  TextStyle get buttonTextStyleColor => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.background,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get buttonBoldTextColor => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.textColor,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get buttonTextColor => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.textColor,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get hint => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.inputNormal,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get input => GoogleFonts.inter(
        fontSize: 16,
        color: AppTheme.colors.inputNormal,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get label => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.textColor,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get subTitle => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.subTitle,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get title => GoogleFonts.inter(
        fontSize: 22,
        color: AppTheme.colors.title,
        fontWeight: FontWeight.bold,
      );
}
