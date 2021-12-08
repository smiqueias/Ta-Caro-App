import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.asset(AppTheme.appImages.appLogo),
      )),
    );
  }
}
