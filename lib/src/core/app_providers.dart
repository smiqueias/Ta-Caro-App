import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tacaro_app/src/modules/create-account/view-model/create_account_vm.dart';
import 'package:tacaro_app/src/modules/login/view-model/login_vm.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<LoginVM>(create: (context) => LoginVMImpl()),
    ChangeNotifierProvider<CreateAccountVM>(create: (context) => CreateAccountVMImpl()),
  ];
}
