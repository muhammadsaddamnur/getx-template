import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:getxtemplate/cores/core_models/model_response_api.dart';
import 'package:getxtemplate/cores/core_services/service_api.dart';
import 'package:getxtemplate/features/provider_sample/models/provider_sample_model.dart';
import 'package:getxtemplate/features/provider_sample/widgets/provider_sample_button.dart';
import 'package:getxtemplate/features/provider_sample/models/provider_sample_model.dart';
import 'package:safeprint/safeprint.dart';

abstract class ProviderSampleProviderAbstract {
  Future getData();

  ///if first method is view, return widget to view
  ///
  Widget viewText();
}

class ProviderSampleProvider
    with ChangeNotifier
    implements ProviderSampleProviderAbstract {
  var providerSample = ModelResponseApi<ProviderSampleModel>();

  @override
  Future getData({id = 1}) async {
    providerSample = ModelResponseApi.loading('loading');
    notifyListeners();
    try {
      var response = await ServiceApi(
        endpoint: 'posts/$id',
        method: Method.get,
      ).hit();
      providerSample = ModelResponseApi.completed(
          await compute(providerSampleModelFromJson, response.toString()));
      notifyListeners();
    } catch (e) {
      providerSample = ModelResponseApi.error(e.toString());
      notifyListeners();
    }
  }

  @override
  Widget viewText() {
    return FutureBuilder(builder: (context, state) {
      if (providerSample.status != null) {
        SafePrint.safeDebug(providerSample.status.toString());
        switch (providerSample.status!) {
          case Status.LOADING:
            return CircularProgressIndicator();
          case Status.COMPLETED:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  providerSample.data!.body.toString(),
                ),
                ProviderSampleButton(
                  onPressed: () {
                    Get.toNamed('/getxsample2/123');
                  },
                )
              ],
            );
          case Status.ERROR:
            return Text(
              providerSample.message!,
            );
        }
      }
      return SizedBox();
    });
  }
}
