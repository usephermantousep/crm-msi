import 'package:crm_msi/cubit/noo_cubit.dart';
import 'package:crm_msi/cubit/outlet_cubit_cubit.dart';
import 'package:crm_msi/cubit/plan_visit_cubit.dart';
import 'package:crm_msi/cubit/user_cubit.dart';
import 'package:crm_msi/cubit/visit_cubit.dart';
import 'package:crm_msi/ui/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => OutletCubitCubit(),
        ),
        BlocProvider(
          create: (_) => NooCubit(),
        ),
        BlocProvider(
          create: (_) => VisitCubit(),
        ),
        BlocProvider(
          create: (_) => UserCubit(),
        ),
        BlocProvider(
          create: (_) => PlanVisitCubit(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
        title: 'CRM - MIS',
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
