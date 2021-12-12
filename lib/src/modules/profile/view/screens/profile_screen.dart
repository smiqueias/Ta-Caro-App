import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Perfil",
              style: AppTheme.textStyles.title.copyWith(fontSize: 36.sp),
            ),
            SizedBox(height: 117.0.h),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.colors.textEnabled,
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context, "/login");
                },
                title: Text(
                  "Sair do aplicativo",
                  style: AppTheme.textStyles.titleListTile,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
