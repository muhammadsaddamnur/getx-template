import 'package:flutter/material.dart';

class BaseControllerProvider with ChangeNotifier {
  int _cart = 1;

  int get cart => _cart;
}
