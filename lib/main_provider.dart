import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getxtemplate/cores/core_base_controllers/base_controller_cubit.dart';
import 'package:getxtemplate/cores/core_base_controllers/base_controller_provider.dart';
import 'package:getxtemplate/cores/core_configs/config_route.dart';
import 'package:getxtemplate/cores/core_configs/config_theme.dart';
import 'package:flutter/material.dart';
import 'package:getxtemplate/features/provider_sample/controllers/provider_sample_provider.dart';
import 'package:provider/provider.dart';
import 'package:safeprint/safeprint.dart';
import 'package:get/get.dart';

import 'cores/core_configs/config_localizations.dart';
import 'features/cubit_sample/cubit_sample.dart';
import 'features/provider_sample/provider_sample.dart';

void main() {
  SafePrint.init(value: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BaseControllerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderSampleProvider(),
        ),
      ],
      child: GetMaterialApp(
          title: 'Provider Demo',
          translations: ConfigLocalizations(),
          locale: Locale('id', 'ID'),
          theme: ConfigTheme.themeData,
          home: ProviderSample(),
          initialRoute: ConfigRoute.initialRoute(),
          unknownRoute: ConfigRoute.unknownRoute(),
          getPages: ConfigRoute.route(),
          routingCallback: (routing) {
            ConfigRoute.middleware(routing!);
          }),
    );
  }
}
