import 'package:getxtemplate/cores/core_configs/config_route.dart';
import 'package:getxtemplate/cores/core_configs/config_theme.dart';
import 'package:flutter/material.dart';
import 'package:getxtemplate/features/getx_sample/getx_sample.dart';
import 'package:safeprint/safeprint.dart';
import 'package:get/get.dart';
import 'cores/core_configs/config_localizations.dart';

void main() {
  SafePrint.init(value: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Getx Demo',
        translations: ConfigLocalizations(),
        locale: Locale('id', 'ID'),
        theme: ConfigTheme.themeData,
        home: GetXSample(),
        initialRoute: ConfigRoute.initialRoute(),
        unknownRoute: ConfigRoute.unknownRoute(),
        getPages: ConfigRoute.route(),
        routingCallback: (routing) {
          ConfigRoute.middleware(routing!);
        });
  }
}
