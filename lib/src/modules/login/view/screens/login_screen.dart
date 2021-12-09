import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/src/provider.dart';
import 'package:tacaro_app/src/core/components/button_component.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/modules/login/view-model/login_vm.dart';
import 'package:tacaro_app/src/modules/login/view/components/form_component.dart';
import 'package:tacaro_app/src/modules/login/view/components/outline_button_component.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginVM>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AppTheme.appImages.appLogo,
                    height: 250.h,
                    width: 250.w,
                  ),
                ),
                FormComponent(
                  label: "E-mail",
                  hintText: "Digite seu email",
                  validator: (value) => isEmail(value ?? "") ? null : "Digite um e-mail válido",
                  onChanged: (value) => viewModel.onChange(email: value),
                ),
                SizedBox(height: 22.0.h),
                FormComponent(
                  label: "Senha",
                  hintText: "Digite sua senha",
                  validator: (value) => isLength(value ?? "", 6) ? null : "Digite uma senha mais forte",
                  obscure: true,
                  onChanged: (value) => viewModel.onChange(password: value),
                ),
                SizedBox(height: 18.0.h),
                ButtonComponent(label: "Entrar", onTap: () {}),
                SizedBox(height: 58.0.h),
                OutlineButtonComponent(
                  label: "Criar uma conta",
                  onTap: () => Navigator.pushNamed(context, '/create-account'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
