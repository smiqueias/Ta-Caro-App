import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/components/button_component.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/modules/login/view/components/form_component.dart';
import 'package:tacaro_app/src/utils/extensions/text_extension.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppTheme.colors.backButton),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 38.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Criando uma conta").title,
              SizedBox(height: 10.0.h),
              const Text("Mantenha seus gastos em dia").subTitle,
              SizedBox(height: 38.0.h),
              const FormComponent(label: "NOME", hintText: "Seu nome"),
              SizedBox(height: 18.0.h),
              const FormComponent(label: "EMAIL", hintText: "email@email.com"),
              SizedBox(height: 18.0.h),
              const FormComponent(label: "SENHA", hintText: "Digite sua senha", obscure: true),
              SizedBox(height: 18.0.h),
              ButtonComponent(label: "Criar conta", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
