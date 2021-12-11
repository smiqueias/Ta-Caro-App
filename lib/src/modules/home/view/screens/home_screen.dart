import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  final UserModel user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${user.name}'),
      ),
    );
  }
}
