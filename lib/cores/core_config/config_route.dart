import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtemplate/features/halaman_2/halaman_2.dart';
import 'package:getxtemplate/features/home_navigator/navigator.dart';
import 'package:safeprint/safeprint.dart';

class ConfigRoute {
  ///initial route
  ///
  static String initialRoute() => '/';

  ///unkownroute 404
  ///
  static GetPage unknownRoute() => GetPage(
      name: '/notfound',
      page: () =>
          Scaffold(body: Center(child: Text('Halaman Tidak Ditemukan'))));

  ///list of route
  ///
  static List<GetPage>? route() {
    return [
      GetPage(
        name: '/',
        page: () => HomeNavigator(),
      ),
      GetPage(
        name: '/halaman2/:user',
        page: () => Halaman2(),
      ),
    ];
  }

  ///middleware
  ///
  static middleware(Routing routing) {
    if (routing.current == '/halaman2/123') {
      SafePrint.safeLog('last route called');
    } else if (routing.current == '/third') {
      SafePrint.safeLog('last route called');
    }
  }
}
