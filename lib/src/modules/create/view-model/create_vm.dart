import 'package:flutter/material.dart';
import 'package:tacaro_app/src/core/state/app_state.dart';
import 'package:tacaro_app/src/modules/create/repositories/create_repository.dart';
import 'package:tacaro_app/src/utils/log.dart';

abstract class CreateVM extends ChangeNotifier {
  String get name;
  String get price;
  String get date;
  AppState get appState;
  GlobalKey<FormState> get formKey;
  void onChange({String? name, String? price, String? date});
  bool validate();
  Future<void> create();
  void update(AppState state);
}

class CreateVMImpl extends ChangeNotifier implements CreateVM {
  AppState _state = AppState.empty();
  final CreateRepository _createRepository;
  static final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _price = "";
  String _date = "";

  CreateVMImpl(this._createRepository);

  @override
  String get name => _name;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  String get price => _price;

  @override
  String get date => _date;

  @override
  AppState get appState => _state;

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
  Future<void> create() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response = await _createRepository.create(name: name, price: price, date: date);
        if (response) {
          update(AppState.success<bool>(response));
        }
      } on Exception catch (error, st) {
        Log.log(
          "Error in CreateVM.create",
          error: error,
          stackTrace: st,
        );
        update(AppState.error("Não foi possível registrar o produto", exception: error));
      }
    }
  }

  @override
  void update(AppState state) {
    _state = state;
    notifyListeners();
  }

  @override
  void onChange({String? name, String? price, String? date, String? preco}) {
    _name = name ?? _name;
    _price = price ?? _price;
    _date = date ?? _date;
  }
}
