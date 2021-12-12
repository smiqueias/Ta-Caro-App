import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/models/user_model.dart';
import 'package:tacaro_app/src/modules/home/view/container/home_container.dart';

class HomeRouter extends StatelessWidget {
  final UserModel user;
  final List<Widget> screens;

  const HomeRouter({Key? key, required this.user, required this.screens}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeContainer(user: user, screens: screens);
  }
}
