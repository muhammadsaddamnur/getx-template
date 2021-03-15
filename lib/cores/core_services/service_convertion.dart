import 'package:intl/intl.dart';

abstract class ServiceConvertionAbstract {
  dynamic currency();
}

class ServiceConvertion implements ServiceConvertionAbstract {
  ///convert your data to currency, default is indonesia Rp.
  ///
  @override
  dynamic currency({String currency = 'Rp. ', dynamic value}) {
    if (value == null) {
      return null;
    } else {
      final format = new NumberFormat("#,##0", "en_US");
      var intValid = int.tryParse(value.toString());
      if (intValid == null) {
        var doubleValid = double.tryParse(value.toString());
        if (doubleValid == null) {
          return value.toString();
        } else {
          String result =
              currency + format.format(doubleValid.round()).toString();
          return result.toString();
        }
      } else {
        String result = currency + format.format(intValid).toString();
        return result.toString();
      }
    }
  }
}
