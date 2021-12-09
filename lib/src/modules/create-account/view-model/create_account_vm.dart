import 'package:flutter/material.dart';

abstract class CreateAccountVM {
  GlobalKey<FormState> get formKey;
  String get email;
  String get password;
  String get confirmPassword;
  String get name;
  void onChange({String? email, String? password, String? confirmPassword, String? name});
  bool validate();
  void createAccount();
}

class CreateAccountVMImpl implements CreateAccountVM {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _name = "";

  @override
  String get confirmPassword => _confirmPassword;

  @override
  void createAccount() {
    if (validate()) {
      // call api
    }
  }

  @override
  String get email => _email;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  void onChange({String? email, String? password, String? confirmPassword, String? name}) {
    _email = email ?? _email;
    _password = password ?? _password;
    _confirmPassword = confirmPassword ?? _confirmPassword;
    _name = name ?? _name;
  }

  @override
  String get password => _password;

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
  String get name => _name;
}
