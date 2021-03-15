import 'package:flutter/material.dart';

class WidgetCard extends StatelessWidget {
  final Widget? child;
  WidgetCard({this.child});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
