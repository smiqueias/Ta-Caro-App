import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tacaro_app/src/modules/login/view-model/login_vm.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    Provider<LoginVM>(create: (context) => LoginVMImpl()),
  ];
}
