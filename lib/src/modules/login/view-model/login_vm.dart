import 'package:flutter/material.dart';

abstract class LoginVM {
  String get email;
  String get password;
  GlobalKey<FormState> get formKey;
  void onChange({String? email, String? password});
  bool validate();
  void login();
}

class LoginVMImpl implements LoginVM {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  @override
  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
  }

  @override
  String get email => _email;

  @override
  GlobalKey<FormState> get formKey => _formKey;

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
  void login() {
    if (validate()) {
      //call login api
    }
  }
}
