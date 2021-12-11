import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/src/provider.dart';
import 'package:tacaro_app/src/core/components/button_component.dart';
import 'package:tacaro_app/src/core/components/loading_component.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/modules/create-account/view-model/create_account_vm.dart';
import 'package:tacaro_app/src/modules/login/view/components/form_component.dart';
import 'package:tacaro_app/src/utils/extensions/text_extension.dart';
import 'package:validators/validators.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late final CreateAccountVM viewModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    viewModel = context.read<CreateAccountVM>();
    viewModel.addListener(() {
      viewModel.appState.when(
        success: (data) => Navigator.pop(context),
        error: (message, _) => scaffoldKey.currentState!.showBottomSheet(
          (context) => BottomSheet(
            onClosing: () {},
            builder: (context) => SizedBox(
              height: 100,
              child: Text(message),
            ),
          ),
        ),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CreateAccountVM>();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppTheme.colors.backButton),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 38.0.h),
          child: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Criando uma conta").title,
                  SizedBox(height: 10.0.h),
                  const Text("Mantenha seus gastos em dia").subTitle,
                  SizedBox(height: 38.0.h),
                  FormComponent(
                    label: "NOME",
                    hintText: "Seu nome",
                    onChanged: (value) => viewModel.onChange(name: value),
                    validator: (value) => isLength(value ?? "", 3) ? null : "Digite uma nome acima de 3 caracteres",
                  ),
                  SizedBox(height: 18.0.h),
                  FormComponent(
                    label: "EMAIL",
                    hintText: "email@email.com",
                    onChanged: (value) => viewModel.onChange(email: value),
                    validator: (value) => isEmail(value ?? "") ? null : "Digite um e-mail válido",
                  ),
                  SizedBox(height: 18.0.h),
                  FormComponent(
                    label: "SENHA",
                    hintText: "Digite sua senha",
                    obscure: true,
                    onChanged: (value) => viewModel.onChange(password: value),
                    validator: (value) => isLength(value ?? "", 6) ? null : "Digite uma senha mais forte",
                  ),
                  SizedBox(height: 18.0.h),
                  FormComponent(
                    label: "CONFIRMAR SENHA",
                    hintText: "Confirme sua senha",
                    obscure: true,
                    onChanged: (value) => viewModel.onChange(confirmPassword: value),
                    validator: (value) {
                      if (value != viewModel.password) {
                        return "As senhas não são iguais";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 18.0.h),
                  AnimatedBuilder(
                    animation: viewModel,
                    builder: (context, _) => viewModel.appState.when(
                      loading: () => const LoadingComponent(),
                      orElse: () => ButtonComponent(
                        label: "Criar conta",
                        onTap: () {
                          viewModel.createAccount();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
