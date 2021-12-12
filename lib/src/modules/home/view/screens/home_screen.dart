import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/components/bottom_navigator_component.dart';
import 'package:tacaro_app/src/core/models/user_model.dart';
import 'package:tacaro_app/src/modules/create/view/screens/create_bottomsheet.dart';
import 'package:tacaro_app/src/modules/feed/view/screens/feed_screen.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  final List<Widget> screens;

  const HomeScreen({Key? key, required this.user, required this.screens}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late final List<Widget> screens = widget.screens;
  void changeIndex(int index) async {
    if (index == 3) {
      await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
        ),
        context: context,
        builder: (context) => const CreateBottomSheet(),
      );
    } else {
      currentIndex = index;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: UniqueKey(),
        child: List.from(screens)[currentIndex],
      ),
      bottomNavigationBar: BottomNavigatorComponent(
        currentIndex: currentIndex,
        onTap: changeIndex,
      ),
    );
  }
}
