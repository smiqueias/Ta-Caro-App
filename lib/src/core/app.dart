import 'package:flutter/material.dart';
import 'package:tacaro_app/src/modules/splash/router/splash_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tá Caro?",
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashRouter(),
      },
    );
  }
}
