import 'package:flutter/material.dart';
import 'package:getxtemplate/cores/core_base_controllers/base_controller_provider.dart';
import 'package:getxtemplate/features/provider_sample/controllers/provider_sample_provider.dart';
import 'package:provider/provider.dart';

class ProviderSampleTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var baseController =
        Provider.of<BaseControllerProvider>(context, listen: true);
    var controller = Provider.of<ProviderSampleProvider>(context, listen: true);
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
      Text(baseController.cart.toString()),
      Expanded(
        child: Center(
          child: controller.viewText(),
        ),
      ),
    ]));
  }
}
