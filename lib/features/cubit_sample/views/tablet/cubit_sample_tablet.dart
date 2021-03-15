import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getxtemplate/cores/core_base_controllers/base_controller_cubit.dart';
import 'package:getxtemplate/features/cubit_sample/controllers/cubit_sample_cubit.dart';

class CubitSampleTablet extends StatelessWidget {
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
      Text(context.read<BaseControllerCubit>().cart.toString()),
      Expanded(
        child: Center(
          child: context.read<CubitSampleCubit>().viewText(),
        ),
      ),
    ]));
  }
}
