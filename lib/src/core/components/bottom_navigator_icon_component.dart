import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

class BottomNavigatorIconComponent extends StatelessWidget {
  final bool enable;
  final Function() onTap;
  final IconData icon;

  const BottomNavigatorIconComponent({
    Key? key,
    required this.enable,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: enable ? AppTheme.colors.primary : AppTheme.colors.background,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          icon,
          color: enable ? AppTheme.colors.textEnabled : AppTheme.colors.iconInactive,
        ),
      ),
    );
  }
}
