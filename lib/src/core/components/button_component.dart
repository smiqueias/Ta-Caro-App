import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/utils/extensions/text_extension.dart';

class ButtonComponent extends StatelessWidget {
  final String label;
  final Function() onTap;
  const ButtonComponent({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0.r),
          color: AppTheme.colors.primary,
        ),
        child: Center(
          child: Text(label).buttonTextStyleColor,
        ),
      ),
    );
  }
}
