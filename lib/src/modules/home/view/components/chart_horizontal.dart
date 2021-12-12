import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

class ChartHorizontal extends StatelessWidget {
  final double percent;

  const ChartHorizontal({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 30.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            gradient: LinearGradient(
              colors: [
                AppTheme.colors.badColor,
                AppTheme.colors.primary,
              ],
              stops: [percent, 0.0],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (percent > 0 && percent <= 1)
                  Text(
                    "${(percent * 100).ceil()}%",
                    style: AppTheme.textStyles.chart,
                  ),
                if ((1 - percent) > 0)
                  Text(
                    "${((1 - percent) * 100).ceil()}%",
                    style: AppTheme.textStyles.chart,
                  )
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "Relação de compras caras e boas compras",
          style: AppTheme.textStyles.hint,
        ),
        SizedBox(height: 14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: AppTheme.colors.badColor,
                ),
                SizedBox(width: 8.w),
                Text(
                  "Ruim",
                  style: AppTheme.textStyles.hint,
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: AppTheme.colors.primary,
                ),
                SizedBox(width: 8.w),
                Text(
                  "Bom",
                  style: AppTheme.textStyles.hint,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
