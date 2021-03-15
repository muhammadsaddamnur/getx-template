import 'package:flutter/material.dart';

class GetxSampleButton extends StatelessWidget {
  final void Function()? onPressed;

  GetxSampleButton({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('wkwkw'),
    );
  }
}
