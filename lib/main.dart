import 'package:getxtemplate/cores/core_config/config_route.dart';
import 'package:getxtemplate/cores/core_config/config_theme.dart';
import 'package:flutter/material.dart';
import 'package:safeprint/safeprint.dart';
import 'package:get/get.dart';
import 'cores/core_config/config_localizations.dart';
import 'features/home_navigator/navigator.dart';

void main() {
  SafePrint.init(value: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        translations: ConfigLocalizations(),
        locale: Locale('id', 'ID'),
        theme: ConfigTheme.themeData,
        home: HomeNavigator(),
        initialRoute: ConfigRoute.initialRoute(),
        unknownRoute: ConfigRoute.unknownRoute(),
        getPages: ConfigRoute.route(),
        routingCallback: (routing) {
          ConfigRoute.middleware(routing!);
        });
  }
}
