import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/modules/create-account/router/create_account_router.dart';
import 'package:tacaro_app/src/modules/login/router/login_router.dart';
import 'package:tacaro_app/src/modules/splash/router/splash_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => MaterialApp(
        title: "Tá Caro?",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: AppTheme.colors.background,
          appBarTheme: AppBarTheme(
            backgroundColor: AppTheme.colors.background,
            elevation: 0,
          ),
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashRouter(),
          '/login': (context) => const LoginRouter(),
          '/create-account': (context) => const CreateAccountRouter(),
        },
      ),
    );
  }
}
