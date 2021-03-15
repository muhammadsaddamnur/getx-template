import 'package:flutter/material.dart';

class ProviderSampleButton extends StatelessWidget {
  final void Function()? onPressed;

  ProviderSampleButton({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('wkwkw'),
    );
  }
}
