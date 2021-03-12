import 'package:getxtemplate/cores/core_config/config_screen.dart';
import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConfigScreen(
                phoneView: Center(child: Text('phone')),
                tabletView: Center(child: Text('tablet')),
                desktopView: Center(child: Text('desktop')))
            .checkResolution(width: MediaQuery.of(context).size.width));
  }
}
