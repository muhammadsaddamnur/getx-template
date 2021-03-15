import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getxtemplate/cores/core_configs/config_color.dart';

void main() {
  test('color is green', () async {
    expect(ConfigColor.green, Colors.green);
  });
}
