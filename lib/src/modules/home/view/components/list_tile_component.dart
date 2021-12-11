import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

class ListTileComponent extends StatelessWidget {
  const ListTileComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.colors.background,
            radius: 30.r,
            child: const Text(
              "12/12",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
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
      ),
    );
  }
}
