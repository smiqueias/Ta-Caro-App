import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tacaro_app/src/core/models/product_model.dart';
import 'package:tacaro_app/src/core/theme/app_theme.dart';

class CardProductsComponent extends StatelessWidget {
  final ProductModel product;

  const CardProductsComponent({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Container(
        width: 250.w,
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
                child: product.currentPrice < product.lastPrice
                    ? const Icon(FontAwesomeIcons.thumbsUp)
                    : Icon(
                        FontAwesomeIcons.thumbsDown,
                        color: AppTheme.colors.badColor,
                      ),
              ),
              title: Text(
                product.name,
                style: AppTheme.textStyles.titleListTile,
              ),
              subtitle: Text(
                "Estava R\$ ${product.lastPrice.toStringAsFixed(2)}",
                style: AppTheme.textStyles.subtitleListTile,
              ),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(child: Text("Editar")),
                  const PopupMenuItem(child: Text("Excluir")),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Text.rich(
                TextSpan(
                  text: "Agora\n",
                  style: AppTheme.textStyles.subtitleListTile,
                  children: [
                    TextSpan(
                      text: "R\$ ${product.currentPrice.toStringAsFixed(2)}",
                      style: AppTheme.textStyles.title,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
