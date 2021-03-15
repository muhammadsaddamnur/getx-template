import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class ServiceLocalStorage {
  String _hiveBox = 'localStorage';
  String key;

  ServiceLocalStorage({required this.key});

  ///init method for hive
  ///
  static init() async {
    if (!kIsWeb) {
      var path = Directory.current.path;
      Hive.init(path);
    }
  }

  ///get data from hive, return data is dynamic
  ///
  get({bool isJson = false}) async {
    var box = await Hive.openBox(_hiveBox);
    if (isJson) {
      return json.decode(box.get(key));
    } else {
      return box.get(key);
    }
  }

  ///you can put any data, data type according to the input
  ///
  put({@required value, bool isJson = false}) async {
    var box = await Hive.openBox(_hiveBox);
    if (isJson) {
      box.put(key, json.encode(value));
    } else {
      box.put(key, value);
    }
  }

  ///delete method
  ///
  delete() async {
    var box = await Hive.openBox(_hiveBox);
    box.delete(key);
  }
}
