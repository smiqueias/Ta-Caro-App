import 'package:flutter/cupertino.dart';
import 'package:tacaro_app/src/core/models/order_model.dart';
import 'package:tacaro_app/src/core/models/product_model.dart';
import 'package:tacaro_app/src/core/state/app_state.dart';
import 'package:tacaro_app/src/modules/feed/repositories/feed_repository.dart';

abstract class FeedVM extends ChangeNotifier {
  AppState get appState;
  void update(AppState state);
  Future<void> getData();
  List<OrderModel> get orders;
  double get sumTotal;
  List<ProductModel> get products;
  double calcChart(List<ProductModel> products);
}

class FeedVMImpl extends ChangeNotifier implements FeedVM {
  AppState _state = AppState.empty();
  final FeedRepository feedRepository;

  FeedVMImpl({required this.feedRepository});
  @override
  AppState get appState => _state;

  @override
  Future<void> getData() async {
    try {
      update(AppState.loading());
      final response = await feedRepository.getAll();
      update(AppState.success<List<OrderModel>>(response));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }

  @override
  void update(AppState state) {
    _state = state;
    notifyListeners();
  }

  @override
  List<OrderModel> get orders => _state.when(success: (value) => value, orElse: () => []);

  @override
  double get sumTotal {
    var sum = 0.0;
    for (var item in orders) {
      sum += item.price;
    }
    return sum;
  }

  @override
  List<ProductModel> get products {
    final products = <ProductModel>[];
    for (var item in orders) {
      final product = ProductModel(name: item.name, lastPrice: 0, currentPrice: item.price);
      final index = products.indexWhere((element) => element.name == product.name);
      if (index != -1) {
        final currentProduct = products[index];
        products[index] = currentProduct.copyWith(lastPrice: item.price);
      } else {
        products.add(product);
      }
    }
    return products;
  }

  @override
  double calcChart(List<ProductModel> products) {
    var up = 0.0;
    var down = 0.0;
    for (var item in products) {
      if (item.currentPrice < item.lastPrice) {
        up += 1;
      } else {
        down += 1;
      }
    }
    final result = down / up;
    if (result > 1) {
      return 1;
    } else {
      return result;
    }
  }
}
