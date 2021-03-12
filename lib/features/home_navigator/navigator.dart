import 'package:getxtemplate/cores/core_config/config_screen.dart';
import 'package:flutter/material.dart';

import 'views/desktop/navigator_desktop.dart';
import 'views/phone/navigator_phone.dart';
import 'views/tablet/navigator_tablet.dart';

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConfigScreen(
                phoneView: NavigatorPhone(),
                tabletView: NavigatorTablet(),
                desktopView: NavigatorDesktop())
            .checkResolution(width: MediaQuery.of(context).size.width));
  }
}
