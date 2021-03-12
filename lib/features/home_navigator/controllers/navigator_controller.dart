import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtemplate/cores/core_models/model_response_api.dart';
import 'package:getxtemplate/cores/core_services/service_api.dart';
import 'package:getxtemplate/features/home_navigator/models/navigator_model.dart';
import 'package:getxtemplate/features/home_navigator/widgets/navigator_button.dart';

abstract class NavigatorAbstract {
  Future getData();

  ///if first method is view, return widget to view
  ///
  Widget viewText();
}

class NavigatorController extends GetxController implements NavigatorAbstract {
  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  var navigatorModel = ModelResponseApi<NavigatorModel>().obs;

  @override
  Future getData({id = 1}) async {
    navigatorModel.value = ModelResponseApi.loading('loading');
    try {
      var response = await ServiceApi(
        endpoint: 'posts/$id',
        method: Method.get,
      ).hit();
      navigatorModel.value = ModelResponseApi.completed(
          await compute(testModelFromJson, response.toString()));
    } catch (e) {
      navigatorModel.value = ModelResponseApi.error(e.toString());
    }
  }

  @override
  Widget viewText() {
    return Obx(() {
      if (navigatorModel.value!.status != null) {
        switch (navigatorModel.value!.status!) {
          case Status.LOADING:
            return CircularProgressIndicator();
          case Status.COMPLETED:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  navigatorModel.value!.data!.body.toString(),
                ),
                NavigatorButton(
                  onPressed: () {
                    Get.toNamed('/halaman2/123');
                  },
                )
              ],
            );
          case Status.ERROR:
            return Text(
              navigatorModel.value!.message!,
            );
        }
      }
      return SizedBox();
    });
  }
}
