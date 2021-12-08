import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/utils/extensions/text_extension.dart';

class OutlineButtonComponent extends StatelessWidget {
  const OutlineButtonComponent({Key? key}) : super(key: key);

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
          border: Border.fromBorderSide(BorderSide(color: AppTheme.colors.border, width: 2)),
          color: AppTheme.colors.background,
        ),
        child: Center(
          child: const Text("Criar uma conta").buttonBoldTextColor,
        ),
      ),
    );
  }
}
