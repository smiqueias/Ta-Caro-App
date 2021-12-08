import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/utils/extensions/text_extension.dart';

class FormComponent extends StatelessWidget {
  final String label;
  final String hintText;

  const FormComponent({Key? key, required this.label, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        const SizedBox(height: 12),
        SizedBox(
          height: 47,
          child: TextFormField(
            style: AppTheme.textStyles.input,
            decoration: InputDecoration(
              hintStyle: AppTheme.textStyles.hint,
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppTheme.colors.border),
              ),
            ),
          ),
        )
      ],
    );
  }
}
