import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/models/user_model.dart';
import 'package:tacaro_app/src/modules/home/view/screens/home_screen.dart';

class HomeContainer extends StatelessWidget {
  final UserModel user;
  final List<Widget> screens;

  const HomeContainer({Key? key, required this.user, required this.screens}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen(user: user, screens: screens);
  }
}
