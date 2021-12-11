import 'package:flutter/foundation.dart';
import 'package:supabase/supabase.dart';
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
  Future<bool> createAccount({required String email, required String password, required String name}) async {
    final response = await client.auth.signUp(email, password);
    return response.error == null;
  }

  @override
  Future<bool> login({required String email, required String password}) async {
    final response = await client.auth.signIn(email: email, password: password);
    return response.error == null;
  }
}
