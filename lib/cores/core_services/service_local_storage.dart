import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class ServiceLocalStorage {
  String _hiveBox = 'localStorage';
  String key;

  ServiceLocalStorage({required this.key});

  ///init method for hive
  ///
  void init() async {
    if (!kIsWeb) {
      var path = Directory.current.path;
      Hive.init(path);
    }
  }

  ///get data from hive, return data is dynamic
  ///
  get() async {
    var box = await Hive.openBox(_hiveBox);
    return box.get(key);
  }

  ///you can put any data, data type according to the input
  ///
  put({@required value}) async {
    var box = await Hive.openBox(_hiveBox);
    box.put(key, value);
  }

  ///delete method
  ///
  delete() async {
    var box = await Hive.openBox(_hiveBox);
    box.delete(key);
  }
}
