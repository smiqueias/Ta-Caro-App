import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/utils/extensions/text_extension.dart';

class OutlineButtonComponent extends StatelessWidget {
  final String label;
  final Function() onTap;
  const OutlineButtonComponent({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.fromBorderSide(BorderSide(color: AppTheme.colors.border, width: 2)),
          color: AppTheme.colors.background,
        ),
        child: Center(
          child: Text(label).buttonBoldTextColor,
        ),
      ),
    );
  }
}
