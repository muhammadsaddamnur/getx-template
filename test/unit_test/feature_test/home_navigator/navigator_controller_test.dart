import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getxtemplate/cores/core_models/model_response_api.dart';
import 'package:getxtemplate/features/getx_sample/controllers/getx_sample_controller.dart';

void main() {
  test('getData() is successed', () async {
    final controller = Get.put(GetxSampleController());
    await controller!.getData(id: 1);
    expect(controller.getxSample.value!.status, Status.COMPLETED);
  });

  test('getData() is failed', () async {
    final controller = Get.put(GetxSampleController());

    await controller!.getData(id: 'a');
    expect(controller.getxSample.value!.status, Status.ERROR);
  });

  test('getData() loading', () async {
    final controller = Get.put(GetxSampleController());
    controller!.getxSample.value = ModelResponseApi.loading('loading');
    expect(controller.getxSample.value!.status, Status.LOADING);
  });
}
