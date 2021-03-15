import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtemplate/cores/core_base_controllers/base_controller.dart';
import 'package:getxtemplate/features/getx_sample/controllers/getx_sample_controller.dart';

class GetxSampleTablet extends StatelessWidget {
  final controller = Get.put(GetxSampleController());
  final baseController = Get.put(BaseController());

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
      Text(baseController!.cart.toString()),
      Expanded(
        child: Center(
          child: controller!.viewText(),
        ),
      ),
    ]));
  }
}
