import 'package:tacaro_app/src/core/models/user_model.dart';
import 'package:tacaro_app/src/core/services/supabase_database.dart';

abstract class AppDatabase {
  static final AppDatabase instance = SupabaseDatabase();
  Future<UserModel> createUser(UserModel user);
  Future<UserModel> getUser(String id);
  Future<List<Map<String, dynamic>>> getAll(String table);
  Future<bool> create({required String table, required Map<String, dynamic> data});
  void intiDatabase();
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> createAccount({required String email, required String password, required String name});
}
