import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getxtemplate/cores/core_base_controllers/base_controller_cubit.dart';
import 'package:getxtemplate/cores/core_configs/config_route.dart';
import 'package:getxtemplate/cores/core_configs/config_theme.dart';
import 'package:flutter/material.dart';
import 'package:safeprint/safeprint.dart';
import 'package:get/get.dart';
import 'cores/core_configs/config_localizations.dart';
import 'features/cubit_sample/controllers/cubit_sample_cubit.dart';
import 'features/cubit_sample/cubit_sample.dart';

void main() {
  SafePrint.init(value: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: true,
          create: (context) => CubitSampleCubit(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => BaseControllerCubit(0),
        ),
      ],
      child: GetMaterialApp(
          title: 'Cubit Demo',
          translations: ConfigLocalizations(),
          locale: Locale('id', 'ID'),
          theme: ConfigTheme.themeData,
          home: CubitSample(),
          initialRoute: ConfigRoute.initialRoute(),
          unknownRoute: ConfigRoute.unknownRoute(),
          getPages: ConfigRoute.route(),
          routingCallback: (routing) {
            ConfigRoute.middleware(routing!);
          }),
    );
  }
}
