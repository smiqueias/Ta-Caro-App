import 'dart:math';

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
    final user = UserModel(email: email, name: name, id: response.user!.id);
    await createUser(user);
    return user;
  }

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final response = await client.auth.signIn(email: email, password: password);
    if (response.error != null) {
      throw Exception(response.error?.message ?? "Não foi possível efetuar o login");
    }
    final user = await getUser(response.user!.id);
    return user;
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    final response = await client.from("users").insert(user.toMap()).execute();

    if (response.error != null) {
      throw Exception(response.error?.message ?? "Não foi possível criar o usuário");
    }

    return user;
  }

  @override
  Future<UserModel> getUser(String id) async {
    final response = await client.from("users").select().filter("id", "eq", id).execute();
    if (response.error != null) {
      throw Exception(response.error?.message ?? "Não foi possível buscar o usuário");
    }
    final user = UserModel.fromMap(response.data[0]);
    return user;
  }

  @override
  Future<bool> create({required String table, required Map<String, dynamic> data}) async {
    final response = await client.from(table).insert(data).execute();
    if (response.error != null) {
      throw Exception(response.error?.message ?? "Não foi possível criar o registro do produto");
    }
    return true;
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(String table) async {
    final response = await client.from(table).select("*").order("created").execute();
    if (response.error != null) {
      throw Exception(response.error?.message ?? "Não foi possível criar o registro do produto");
    }
    return (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
  }
}
