import 'package:tacaro_app/src/core/models/order_model.dart';
import 'package:tacaro_app/src/core/services/app_database.dart';

abstract class FeedRepository {
  Future<List<OrderModel>> getAll();
}

class FeedRepositoryImpl implements FeedRepository {
  final AppDatabase database;

  FeedRepositoryImpl({required this.database});

  @override
  Future<List<OrderModel>> getAll() async {
    final response = await database.getAll("orders");
    return response.map((e) => OrderModel.fromMap(e)).toList();
  }
}
