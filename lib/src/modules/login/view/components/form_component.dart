import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/utils/extensions/text_extension.dart';

class FormComponent extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscure;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const FormComponent({
    Key? key,
    required this.label,
    required this.hintText,
    this.obscure = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        SizedBox(height: 12.h),
        TextFormField(
          onChanged: onChanged,
          validator: validator,
          obscureText: obscure,
          style: AppTheme.textStyles.input,
          decoration: InputDecoration(
            hintStyle: AppTheme.textStyles.hint,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppTheme.colors.border),
            ),
          ),
        )
      ],
    );
  }
}
