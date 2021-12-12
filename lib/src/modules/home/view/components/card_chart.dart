import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/modules/home/view/components/chart_horizontal.dart';
import '../../../../utils/extensions/text_extension.dart';

class CardChart extends StatelessWidget {
  final double value;
  final double percent;

  const CardChart({Key? key, required this.value, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppTheme.colors.textEnabled,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Gasto mensal").label,
            SizedBox(height: 18.h),
            Text.rich(
              TextSpan(
                text: "R\$ ",
                style: AppTheme.textStyles.label,
                children: [
                  TextSpan(
                    text: value.toStringAsFixed(2).replaceAll(".", ","),
                    style: AppTheme.textStyles.title.copyWith(fontSize: 36.sp),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            ChartHorizontal(
              percent: percent,
            )
          ],
        ),
      ),
    );
  }
}
