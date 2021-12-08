import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/utils/extensions/text_extension.dart';

class ButtonComponent extends StatelessWidget {
  final String label;

  const ButtonComponent({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Click");
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppTheme.colors.primary,
        ),
        child: Center(
          child: Text(label).buttonTextStyleColor,
        ),
      ),
    );
  }
}
