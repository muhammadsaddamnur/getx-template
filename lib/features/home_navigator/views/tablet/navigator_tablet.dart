import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtemplate/features/home_navigator/controllers/navigator_controller.dart';

class NavigatorTablet extends StatelessWidget {
  final controller = Get.put(NavigatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: <Widget>[
      NavigationRail(
        selectedIndex: 0,
        onDestinationSelected: (int index) {},
        labelType: NavigationRailLabelType.selected,
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: Text('First'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.bookmark_border),
            selectedIcon: Icon(Icons.book),
            label: Text('Second'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.star_border),
            selectedIcon: Icon(Icons.star),
            label: Text('Third'),
          ),
        ],
      ),
      VerticalDivider(thickness: 1, width: 1),
      Expanded(
        child: Center(
          child: controller!.viewText(),
        ),
      ),
    ]));
  }
}
