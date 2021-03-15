import 'package:flutter/material.dart';
import 'package:getxtemplate/cores/core_configs/config_screen.dart';
import 'package:getxtemplate/features/provider_sample/controllers/provider_sample_provider.dart';
import 'package:provider/provider.dart';

import 'views/tablet/provider_sample_tablet.dart';

class ProviderSample extends StatefulWidget {
  @override
  _ProviderSampleState createState() => _ProviderSampleState();
}

class _ProviderSampleState extends State<ProviderSample> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      var controller =
          Provider.of<ProviderSampleProvider>(context, listen: false);
      controller.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConfigScreen(
                phoneView: Center(child: Text('phone')),
                tabletView: ProviderSampleTablet(),
                desktopView: Center(child: Text('desktop')))
            .checkResolution(width: MediaQuery.of(context).size.width));
  }
}
