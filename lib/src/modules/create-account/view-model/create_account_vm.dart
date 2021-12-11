import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/services/app_database.dart';
import 'package:tacaro_app/src/core/state/app_state.dart';
import 'package:tacaro_app/src/modules/create-account/repositories/create_account_repository.dart';
import 'package:tacaro_app/src/utils/log.dart';

abstract class CreateAccountVM extends ChangeNotifier {
  AppState get appState;
  GlobalKey<FormState> get formKey;
  String get email;
  String get password;
  String get confirmPassword;
  String get name;
  void onChange({String? email, String? password, String? confirmPassword, String? name});
  bool validate();
  Future<void> createAccount();
  void update(AppState state);
}

class CreateAccountVMImpl extends ChangeNotifier implements CreateAccountVM {
  final _formKey = GlobalKey<FormState>();
  AppState _state = AppState.empty();
  final CreateAccountRepository createAccountRepository;
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _name = "";

  CreateAccountVMImpl({required this.createAccountRepository});

  @override
  String get confirmPassword => _confirmPassword;

  @override
  String get email => _email;

  @override
  AppState get appState => _state;

  @override
  String get name => _name;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  String get password => _password;

  @override
  void onChange({String? email, String? password, String? confirmPassword, String? name}) {
    _email = email ?? _email;
    _password = password ?? _password;
    _confirmPassword = confirmPassword ?? _confirmPassword;
    _name = name ?? _name;
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
  Future<void> createAccount() async {
    if (validate()) {
      try {
        update(AppState.loading());
        await createAccountRepository.createAccount(email: _email, password: _password, name: _name);
        update(AppState.success<String>("Usuário criado"));
      } catch (error, st) {
        Log.log(
          "Error in CreateAccountVMImpl.createAccount",
          error: error,
          stackTrace: st,
        );
        update(AppState.error("Não foi possível realizar o cadastro", exception: error as Exception));
      }
    }
  }

  @override
  void update(AppState state) {
    _state = state;
    notifyListeners();
  }
}
