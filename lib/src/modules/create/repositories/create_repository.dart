import 'package:flutter/cupertino.dart';
import 'package:tacaro_app/src/core/services/app_database.dart';

abstract class CreateRepository extends ChangeNotifier {
  Future<bool> create({required String name, required String price, required String date});
}

class CreateRepositoryImpl extends ChangeNotifier implements CreateRepository {
  final AppDatabase appDatabase;

  CreateRepositoryImpl({required this.appDatabase});

  @override
  Future<bool> create({required String name, required String price, required String date}) async {
    final priceSanitize = double.parse(price.replaceAll("R\$", ""));
    final response = await appDatabase.create(table: "orders", data: {
      "name": name,
      "price": priceSanitize,
      "created": date,
    });
    return response;
  }
}
