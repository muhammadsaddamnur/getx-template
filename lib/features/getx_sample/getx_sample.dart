import 'package:getxtemplate/cores/core_configs/config_screen.dart';
import 'package:flutter/material.dart';

import 'views/desktop/getx_sample_desktop.dart';
import 'views/phone/getx_sample_phone.dart';
import 'views/tablet/getx_sample_tablet.dart';

class GetXSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConfigScreen(
                phoneView: GetxSamplePhone(),
                tabletView: GetxSampleTablet(),
                desktopView: GetxSampleDesktop())
            .checkResolution(width: MediaQuery.of(context).size.width));
  }
}
