import 'package:tacaro_app/src/core/services/app_database.dart';

abstract class CreateAccountRepository {
  Future<bool> createAccount({required String email, required String password, required String name});
}

class CreateAccountRepositoryImpl implements CreateAccountRepository {
  final AppDatabase database;

  CreateAccountRepositoryImpl({required this.database});

  @override
  Future<bool> createAccount({required String email, required String password, required String name}) async {
    final response = await database.createAccount(email: email, password: password, name: name);
    return response;
  }
}
