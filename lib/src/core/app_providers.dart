import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tacaro_app/src/core/services/app_database.dart';
import 'package:tacaro_app/src/core/services/supabase_database.dart';
import 'package:tacaro_app/src/modules/create-account/repositories/create_account_repository.dart';
import 'package:tacaro_app/src/modules/create-account/view-model/create_account_vm.dart';
import 'package:tacaro_app/src/modules/login/repositories/login_repository.dart';
import 'package:tacaro_app/src/modules/login/view-model/login_vm.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    //AppDatabase
    Provider<AppDatabase>(
      create: (_) => SupabaseDatabase(),
    ),

    //Repositories
    Provider<LoginRepository>(create: (context) => LoginRepositoryImpl(database: context.read<AppDatabase>())),
    Provider<CreateAccountRepository>(create: (context) => CreateAccountRepositoryImpl(database: context.read<AppDatabase>())),

    // ViewModels
    ChangeNotifierProvider<LoginVM>(create: (context) => LoginVMImpl(loginRepository: context.read<LoginRepository>())),
    ChangeNotifierProvider<CreateAccountVM>(
      create: (context) => CreateAccountVMImpl(createAccountRepository: context.read<CreateAccountRepository>()),
    ),
  ];
}
