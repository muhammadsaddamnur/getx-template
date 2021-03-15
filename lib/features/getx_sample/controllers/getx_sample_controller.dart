import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtemplate/cores/core_models/model_response_api.dart';
import 'package:getxtemplate/cores/core_services/service_api.dart';
import 'package:getxtemplate/features/getx_sample/models/getx_sample_model.dart';
import 'package:getxtemplate/features/getx_sample/widgets/getx_sample_button.dart';

abstract class GetxSampleControllerAbstract {
  Future getData();

  ///if first method is view, return widget to view
  ///
  Widget viewText();
}

class GetxSampleController extends GetxController
    implements GetxSampleControllerAbstract {
  var getxSample = ModelResponseApi<GetxSampleModel>().obs;

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  @override
  Future getData({id = 1}) async {
    getxSample.value = ModelResponseApi.loading('loading');
    try {
      var response = await ServiceApi(
        endpoint: 'posts/$id',
        method: Method.get,
      ).hit();
      getxSample.value = ModelResponseApi.completed(
          await compute(getxSampleModelFromJson, response.toString()));
    } catch (e) {
      getxSample.value = ModelResponseApi.error(e.toString());
    }
  }

  @override
  Widget viewText() {
    return Obx(() {
      if (getxSample.value!.status != null) {
        switch (getxSample.value!.status!) {
          case Status.LOADING:
            return CircularProgressIndicator();
          case Status.COMPLETED:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getxSample.value!.data!.body.toString(),
                ),
                GetxSampleButton(
                  onPressed: () {
                    Get.toNamed('/getxsample2/123');
                  },
                )
              ],
            );
          case Status.ERROR:
            return Text(
              getxSample.value!.message!,
            );
        }
      }
      return SizedBox();
    });
  }
}
