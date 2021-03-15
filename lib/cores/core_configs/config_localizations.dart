import 'package:get/get.dart';

class ConfigLocalizations extends Translations {
  ///input your language in here
  ///
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
        },
        'id_ID': {
          'hello': 'Hallo Semua',
        }
      };
}
