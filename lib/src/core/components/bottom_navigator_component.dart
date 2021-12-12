import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/components/bottom_navigator_icon_component.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

class BottomNavigatorComponent extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const BottomNavigatorComponent({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 26.w,
        right: 26.w,
        bottom: 16.h,
      ),
      child: Container(
        height: 76.h,
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavigatorIconComponent(
              icon: Icons.home,
              enable: currentIndex == 0,
              onTap: () {
                onTap(0);
              },
            ),
            BottomNavigatorIconComponent(
              icon: Icons.add,
              enable: false,
              onTap: () {
                onTap(3);
              },
            ),
            BottomNavigatorIconComponent(
              icon: Icons.settings,
              enable: currentIndex == 1,
              onTap: () {
                onTap(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
