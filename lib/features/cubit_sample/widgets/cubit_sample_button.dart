import 'package:flutter/material.dart';

class CubitSampleButton extends StatelessWidget {
  final void Function()? onPressed;

  CubitSampleButton({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('wkwkw'),
    );
  }
}
