import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/models/order_model.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

class ListTileComponent extends StatelessWidget {
  final OrderModel order;

  const ListTileComponent({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.colors.background,
            radius: 30.r,
            child: Text(
              order.created.split("-").sublist(1).reversed.join("/"),
              style: AppTheme.textStyles.label,
            ),
          ),
          title: Text(
            order.name,
            style: AppTheme.textStyles.titleListTile,
          ),
          subtitle: Text(
            "R\$ ${order.price.toStringAsFixed(2)}",
            style: AppTheme.textStyles.subtitleListTile,
          ),
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
