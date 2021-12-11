import 'package:flutter/foundation.dart';
import 'package:supabase/supabase.dart';
import 'package:tacaro_app/src/core/models/user_model.dart';
import 'package:tacaro_app/src/core/services/app_database.dart';

class SupabaseDatabase implements AppDatabase {
  late final SupabaseClient client;

  SupabaseDatabase() {
    intiDatabase();
  }
  @override
  void intiDatabase() {
    client = SupabaseClient(
      const String.fromEnvironment("SUPABASEURL"),
      const String.fromEnvironment("SUPABASEKEY"),
    );
    if (!kReleaseMode) {
      print("Database Initialized");
      print("URL: ${const String.fromEnvironment("SUPABASEURL")}");
      print("KEY: ${const String.fromEnvironment("SUPABASEKEY")}");
    }
  }

  @override
  Future<UserModel> createAccount({required String email, required String password, required String name}) async {
    final response = await client.auth.signUp(email, password);
    if (response.error != null) {
      throw Exception(response.error?.message ?? "Não foi possível criar a conta");
    }
    final user = UserModel.fromMap(response.user!.toJson());
    return user;
  }

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final response = await client.auth.signIn(email: email, password: password);
    if (response.error != null) {
      throw Exception(response.error?.message ?? "Não foi possível efetuar o login");
    }
    final user = UserModel.fromMap(response.user!.toJson());
    return user;
  }
}
