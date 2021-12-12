import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/utils/extensions/text_extension.dart';

class ErrorBottomSheet extends StatelessWidget {
  const ErrorBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
      child: Column(
        children: [
          const Center(
            child: Icon(
              FontAwesomeIcons.exclamationCircle,
              color: Colors.red,
              size: 80,
            ),
          ),
          SizedBox(height: 100.h),
          Text(
            "E-mail ou senha incorretos.",
            style: AppTheme.textStyles.label.copyWith(
              fontSize: 24.sp,
            ),
          )
        ],
      ),
    );
  }
}
