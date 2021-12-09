import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/components/button_component.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/modules/login/view/components/form_component.dart';
import 'package:tacaro_app/src/modules/login/view/components/outline_button_component.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AppTheme.appImages.appLogo,
                    height: 223,
                    width: 223,
                  ),
                ),
                FormComponent(
                  label: "E-mail",
                  hintText: "Digite seu email",
                  validator: (value) => isEmail(value ?? "") ? null : "Digite um e-mail válido",
                ),
                const SizedBox(height: 18.0),
                FormComponent(
                  label: "Senha",
                  hintText: "Digite sua senha",
                  validator: (value) => isLength(value ?? "", 6) ? null : "Digite uma senha mais forte",
                  obscure: true,
                ),
                const SizedBox(height: 15.0),
                ButtonComponent(label: "Entrar", onTap: () {}),
                const SizedBox(height: 58.0),
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
