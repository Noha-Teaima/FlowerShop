import 'package:bloc/bloc.dart';
import 'package:ecommerce/ecommerce/homeScreen.dart';
// import 'package:task/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

import '../../helper/api_url.dart';
import '../../helper/dio_helper.dart';
import '../../login/LoginScreen.dart';
import '../../login/model/loginModel.dart';
//import '../sign_up.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  DioHelper _dioHelper = DioHelper();
  LoginModel loginModel = LoginModel();

  void signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(SignUpLoadingState());
    try {
      final response = await _dioHelper.postData(
        path: ApiUrl.register,
        body: {
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        Get.offAll(VerticalSliderDemo());
        emit(SignUpSuccessState());
      } else {
        Get.snackbar("Error", loginModel.message ?? "",
            backgroundColor: Colors.red);
        emit(SignUpErrorState());
      }
    } catch (e) {
      emit(SignUpErrorState());
    }
  }
}
