import 'package:tacaro_app/src/core/models/user_model.dart';
import 'package:tacaro_app/src/core/services/app_database.dart';

abstract class LoginRepository {
  Future<UserModel> login({required String email, required String password});
}

class LoginRepositoryImpl implements LoginRepository {
  final AppDatabase database;
  LoginRepositoryImpl({required this.database});

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final response = await database.login(email: email, password: password);
    return response;
  }
}
