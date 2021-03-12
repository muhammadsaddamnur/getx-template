import 'package:intl/intl.dart';

abstract class ServiceConvertionAbstract {
  String currency();
}

class ServiceConvertion implements ServiceConvertionAbstract {
  ///convert your data to currency, default is indonesia Rp.
  ///
  @override
  String currency({String currency = 'Rp. ', dynamic value}) {
    final format = new NumberFormat("#,##0", "en_US");
    var intValid = int.tryParse(value);
    if (intValid == null) {
      var doubleValid = double.tryParse(value);
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
