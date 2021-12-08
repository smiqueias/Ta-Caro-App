import 'package:tacaro_app/src/core/theme/app_colors.dart';
import 'package:tacaro_app/src/core/theme/app_text_styles.dart';

class AppTheme {
  static final instance = AppTheme();

  final _colors = AppColorsImpl();
  static AppColors get colors => instance._colors;

  final _textStyles = AppTextStyleImpl();
  static AppTextStyle get textStyles => instance._textStyles;
}
