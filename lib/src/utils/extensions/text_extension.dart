import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

class TextExtension {}

extension TextExt on Text {
  Text get label => Text(data!, style: AppTheme.textStyles.label);
  Text get buttonTextStyleColor => Text(data!, style: AppTheme.textStyles.buttonTextStyleColor);
  Text get buttonBoldTextColor => Text(data!, style: AppTheme.textStyles.buttonBoldTextColor);
  Text get title => Text(data!, style: AppTheme.textStyles.title);
  Text get subTitle => Text(data!, style: AppTheme.textStyles.subTitle);
}
