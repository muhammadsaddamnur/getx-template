import 'package:get/get.dart';
import 'package:getxtemplate/cores/core_config/config_screen.dart';
import 'package:flutter/material.dart';

class Halaman2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConfigScreen(
                phoneView: Center(child: Text('phone')),
                tabletView:
                    Center(child: Text('tablet' + Get.parameters['user']!)),
                desktopView: Center(child: Text('desktop')))
            .checkResolution(width: MediaQuery.of(context).size.width));
  }
}
