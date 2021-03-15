import 'package:get/get.dart';
import 'package:getxtemplate/cores/core_configs/config_screen.dart';
import 'package:flutter/material.dart';
import 'package:getxtemplate/cores/core_widgets/widget_card.dart';

class GetxSample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConfigScreen(
                phoneView: Center(child: Text('phone')),
                tabletView: Center(
                    child: WidgetCard(
                        child: Text('tablet' + Get.parameters['user']!))),
                desktopView: Center(child: Text('desktop')))
            .checkResolution(width: MediaQuery.of(context).size.width));
  }
}
