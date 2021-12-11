import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/services/app_database.dart';
import 'package:tacaro_app/src/core/state/app_state.dart';
import 'package:tacaro_app/src/utils/log.dart';

abstract class LoginVM extends ChangeNotifier {
  String get email;
  String get password;
  AppState get appState;
  GlobalKey<FormState> get formKey;
  void onChange({String? email, String? password});
  bool validate();
  Future<void> login();
  void update(AppState state);
}

class LoginVMImpl extends ChangeNotifier implements LoginVM {
  AppState _state = AppState.empty();
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  @override
  String get email => _email;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  String get password => _password;

  @override
  AppState get appState => _state;

  @override
  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
  }

  @override
  bool validate() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Future<void> login() async {
    if (validate()) {
      try {
        update(AppState.loading());
        await AppDatabase.instance.login(email: _email, password: _password);
        update(AppState.success<String>("Usuário Logado"));
      } catch (error, st) {
        Log.log(
          "Error in LoginVMImpl.login",
          error: error,
          stackTrace: st,
        );
        update(AppState.error("Não foi possível realizar login", exception: error as Exception));
      }
    }
  }

  @override
  void update(AppState state) {
    _state = state;
    notifyListeners();
  }
}
