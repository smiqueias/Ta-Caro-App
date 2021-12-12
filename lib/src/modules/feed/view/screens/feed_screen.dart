import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/models/order_model.dart';
import 'package:tacaro_app/src/core/services/supabase_database.dart';
import 'package:tacaro_app/src/modules/feed/repositories/feed_repository.dart';
import 'package:tacaro_app/src/modules/feed/view-model/feed_vm.dart';
import 'package:tacaro_app/src/modules/home/view/components/card_chart.dart';
import 'package:tacaro_app/src/modules/home/view/components/card_products_component.dart';
import 'package:tacaro_app/src/modules/home/view/components/list_tile_component.dart';
import 'package:tacaro_app/src/utils/extensions/text_extension.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late final FeedVM viewModel;

  @override
  void initState() {
    viewModel = FeedVMImpl(feedRepository: FeedRepositoryImpl(database: SupabaseDatabase()));
    viewModel.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: AnimatedBuilder(
              animation: viewModel,
              builder: (_, __) => viewModel.appState.when(
                success: (value) {
                  final orders = value as List<OrderModel>;
                  final products = viewModel.products;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardChart(value: viewModel.sumTotal, percent: viewModel.calcChart(products)),
                            SizedBox(height: 27.h),
                            const Text("Preço dos produtos").label,
                            SizedBox(height: 14.h),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 126,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.products.length,
                                itemBuilder: (context, index) => CardProductsComponent(
                                  product: products[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 27.h),
                            const Text("Suas últimas compras").label,
                            SizedBox(height: 18.h),
                            for (var order in orders)
                              ListTileComponent(
                                order: order,
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
