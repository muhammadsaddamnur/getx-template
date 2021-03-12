import 'package:flutter/cupertino.dart';

abstract class ConfigScreenAbstract {
  Widget? checkResolution({double? width});
}

class ConfigScreen implements ConfigScreenAbstract {
  ///bypass phone view if you needed
  ///
  final bool? bypassPhone;

  ///return view widget for phone
  ///
  final Widget? phoneView;

  ///return view widget for tablet
  ///
  final Widget? tabletView;

  ///return view widget for desktop
  ///
  final Widget? desktopView;
  ConfigScreen(
      {@required this.phoneView,
      this.tabletView,
      this.desktopView,
      this.bypassPhone = false});

  ///check resolution from devices
  ///
  @override
  Widget? checkResolution({double? width}) {
    try {
      if (bypassPhone == false) {
        if (width! < 540) {
          return phoneView;
        } else if (width >= 540 && width < 1024) {
          return tabletView ?? phoneView;
        } else {
          return desktopView ?? phoneView;
        }
      }
    } catch (e) {}
  }
}
