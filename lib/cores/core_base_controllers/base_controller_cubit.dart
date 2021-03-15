import 'package:flutter_bloc/flutter_bloc.dart';

class BaseControllerCubit extends Cubit {
  BaseControllerCubit(initialState) : super(initialState);

  int cart = 1;
}
