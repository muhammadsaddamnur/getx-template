import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  final void Function()? onPressed;

  NavigatorButton({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('wkwkw'),
    );
  }
}
