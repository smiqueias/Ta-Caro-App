import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

class CardProductsComponent extends StatelessWidget {
  const CardProductsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 230.w,
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.colors.background,
                radius: 30.r,
                child: const Icon(Icons.linked_camera),
              ),
              title: const Text("Carne 1Kg"),
              subtitle: const Text("R\$ 8,00"),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(child: Text("Editar")),
                  const PopupMenuItem(child: Text("Excluir")),
                ],
              ),
            ),
            const Text.rich(
              TextSpan(
                text: "Agora\n",
                children: [
                  TextSpan(text: "R\$ 67,50"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
