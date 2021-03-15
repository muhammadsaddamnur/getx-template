import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:getxtemplate/cores/core_models/model_response_api.dart';
import 'package:getxtemplate/cores/core_services/service_api.dart';
import 'package:getxtemplate/features/cubit_sample/models/cubit_sample_model.dart';
import 'package:getxtemplate/features/cubit_sample/widgets/cubit_sample_button.dart';
import 'package:safeprint/safeprint.dart';

abstract class CubitSampleCubitAbstract {
  Future getData();

  ///if first method is view, return widget to view
  ///
  Widget viewText();
}

class CubitSampleCubit extends Cubit<CubitSampleModel>
    implements CubitSampleCubitAbstract {
  CubitSampleCubit() : super(CubitSampleModel()) {
    getData();
  }

  var cubitSample = ModelResponseApi<CubitSampleModel>();

  @override
  Future getData({id = 1}) async {
    cubitSample = ModelResponseApi.loading('loading');
    try {
      var response = await ServiceApi(
        endpoint: 'posts/$id',
        method: Method.get,
      ).hit();
      cubitSample = ModelResponseApi.completed(
          await compute(cubitSampleModelFromJson, response.toString()));
      emit(state);
    } catch (e) {
      cubitSample = ModelResponseApi.error(e.toString());
      emit(state);
    }
  }

  @override
  Widget viewText() {
    return BlocBuilder<CubitSampleCubit, CubitSampleModel>(
        builder: (context, state) {
      if (cubitSample.status != null) {
        SafePrint.safeDebug(cubitSample.status.toString());
        switch (cubitSample.status!) {
          case Status.LOADING:
            return CircularProgressIndicator();
          case Status.COMPLETED:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cubitSample.data!.body.toString(),
                ),
                CubitSampleButton(
                  onPressed: () {
                    Get.toNamed('/getxsample2/123');
                  },
                )
              ],
            );
          case Status.ERROR:
            return Text(
              cubitSample.message!,
            );
        }
      }
      return SizedBox();
    });
  }
}
