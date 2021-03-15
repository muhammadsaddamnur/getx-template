import 'package:flutter/material.dart';
import 'package:getxtemplate/cores/core_configs/config_screen.dart';
import 'package:getxtemplate/features/cubit_sample/views/tablet/cubit_sample_tablet.dart';

class CubitSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConfigScreen(
                phoneView: Center(child: Text('phone')),
                tabletView: CubitSampleTablet(),
                desktopView: Center(child: Text('desktop')))
            .checkResolution(width: MediaQuery.of(context).size.width));
  }
}
