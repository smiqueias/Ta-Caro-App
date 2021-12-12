import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tacaro_app/src/core/components/button_component.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:tacaro_app/src/core/components/loading_component.dart';
import 'package:tacaro_app/src/core/services/supabase_database.dart';
import 'package:tacaro_app/src/modules/create/repositories/create_repository.dart';
import 'package:tacaro_app/src/modules/create/view-model/create_vm.dart';
import 'package:tacaro_app/src/modules/login/view/components/form_component.dart';

class CreateBottomSheet extends StatefulWidget {
  const CreateBottomSheet({Key? key}) : super(key: key);

  @override
  State<CreateBottomSheet> createState() => _CreateBottomSheetState();
}

class _CreateBottomSheetState extends State<CreateBottomSheet> {
  late final CreateVM viewModel;

  @override
  void initState() {
    viewModel = CreateVMImpl(CreateRepositoryImpl(appDatabase: SupabaseDatabase()));
    viewModel.addListener(() {
      viewModel.appState.when(
          success: (_) {
            Navigator.pop(context);
          },
          orElse: () {});
    });
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              SizedBox(height: 32.h),
              FormComponent(
                label: "Produto",
                hintText: "Digite um nome",
                onChanged: (value) => viewModel.onChange(name: value),
                validator: (value) => value!.isNotEmpty ? null : "Favor digitar um nome",
              ),
              SizedBox(height: 8.h),
              FormComponent(
                label: "Preço",
                hintText: "Digite um preçp",
                onChanged: (value) => viewModel.onChange(price: value),
                validator: (value) => value!.isNotEmpty ? null : "Favor digitar um valor",
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MoneyInputFormatter(
                    leadingSymbol: "R\$ ",
                  )
                ],
              ),
              SizedBox(height: 8.h),
              FormComponent(
                label: "Data da compra",
                hintText: "Digite dd/mm/aaaa",
                inputFormatters: [MaskedInputFormatter('00/00/0000')],
                onChanged: (value) => viewModel.onChange(date: value),
                validator: (value) => value!.isNotEmpty ? null : "Favor digitar uma data",
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 8.h),
              SizedBox(height: 20.h),
              AnimatedBuilder(
                animation: viewModel,
                builder: (_, __) => viewModel.appState.when(
                  loading: () => const LoadingComponent(),
                  error: (message, _) => Text(message),
                  orElse: () => ButtonComponent(
                    label: "Adicionar",
                    onTap: () {
                      viewModel.create();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
