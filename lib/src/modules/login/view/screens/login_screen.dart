import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/components/button_component.dart';
import 'package:tacaro_app/src/core/components/loading_component.dart';
import 'package:tacaro_app/src/core/services/supabase_database.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/modules/create/view/screens/create_bottomsheet.dart';
import 'package:tacaro_app/src/modules/login/repositories/login_repository.dart';
import 'package:tacaro_app/src/modules/login/view-model/login_vm.dart';
import 'package:tacaro_app/src/modules/login/view/components/error_bottomsheet.dart';
import 'package:tacaro_app/src/modules/login/view/components/form_component.dart';
import 'package:tacaro_app/src/modules/login/view/components/outline_button_component.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final viewModel = LoginVMImpl(
    loginRepository: LoginRepositoryImpl(database: SupabaseDatabase()),
  );
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool obscurePassword = true;

  changeObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  void initState() {
    viewModel.addListener(() {
      viewModel.appState.when(
        success: (data) => Navigator.pushNamed(context, '/home', arguments: data),
        error: (message, _) => showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.r),
              topRight: Radius.circular(32.r),
            ),
          ),
          builder: (context) => const ErrorBottomSheet(),
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
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.0.w),
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
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
                    validator: (value) => isEmail(value ?? "") ? null : "Digite um e-mail v??lido",
                    onChanged: (value) => viewModel.onChange(email: value),
                  ),
                  SizedBox(height: 22.0.h),
                  FormComponent(
                    label: "Senha",
                    hintText: "Digite sua senha",
                    validator: (value) => isLength(value ?? "", 6) ? null : "Digite uma senha mais forte",
                    obscure: obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword ? Icons.visibility : Icons.visibility_off,
                        color: AppTheme.colors.iconInactive,
                      ),
                      onPressed: () => changeObscurePassword(),
                    ),
                    onChanged: (value) => viewModel.onChange(password: value),
                  ),
                  SizedBox(height: 18.0.h),
                  AnimatedBuilder(
                    animation: viewModel,
                    builder: (context, _) => viewModel.appState.when(
                      loading: () => const LoadingComponent(),
                      orElse: () => ButtonComponent(
                        label: "Entrar",
                        onTap: () {
                          viewModel.login();
                        },
                      ),
                    ),
                  ),
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
      ),
    );
  }
}
