import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/components/bottom_navigator_component.dart';
import 'package:tacaro_app/src/core/models/user_model.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';
import 'package:tacaro_app/src/modules/home/view/components/card_products_component.dart';
import 'package:tacaro_app/src/modules/home/view/components/list_tile_component.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 160.h,
                  width: 232.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => const CardProductsComponent(),
                  ),
                ),
                const ListTileComponent(),
                const ListTileComponent(),
                const ListTileComponent(),
                const ListTileComponent(),
              ],
            ),
            Positioned(
              left: 26.w,
              right: 26.w,
              bottom: 16.h,
              child: BottomNavigatorComponent(
                currentIndex: currentIndex,
                onTap: changeIndex,
              ),
            )
          ],
        ),
      ),
    );
  }
}
