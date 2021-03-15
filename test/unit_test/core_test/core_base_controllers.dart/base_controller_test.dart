import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getxtemplate/cores/core_base_controllers/base_controller.dart';
import 'package:safeprint/safeprint.dart';

void main() {
  test('cart = 1 is true', () async {
    final controller = Get.put(BaseController());
    SafePrint.safeDebug(controller!.cart.value);
    expect(controller.cart.value, 1);
  });
}
