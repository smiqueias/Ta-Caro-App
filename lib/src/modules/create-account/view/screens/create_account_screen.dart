import 'dart:io';

import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 38.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Criando uma conta").title,
              const SizedBox(height: 10.0),
              const Text("Mantenha seus gastos em dia").subTitle,
              const SizedBox(height: 38.0),
              const FormComponent(label: "NOME", hintText: "Seu nome"),
              const SizedBox(height: 18.0),
              const FormComponent(label: "EMAIL", hintText: "email@email.com"),
              const SizedBox(height: 18.0),
              const FormComponent(label: "SENHA", hintText: "Digite sua senha", obscure: true),
              const SizedBox(height: 18.0),
              ButtonComponent(label: "Criar conta", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
