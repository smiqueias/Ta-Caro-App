import 'package:tacaro_app/src/core/services/supabase_database.dart';

abstract class AppDatabase {
  static final AppDatabase instance = SupabaseDatabase();
  void intiDatabase();
  Future<bool> login({required String email, required String password});
  Future<bool> createAccount({required String email, required String password, required String name});
}
