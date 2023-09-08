//import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/ecommerce/homeScreen.dart';
// import 'package:task/helper/api_url.dart';
// import 'package:task/helper/dio_helper.dart';
// import 'package:task/login/LoginScreen.dart';
// import 'package:task/login/model/loginModel.dart';
//import 'package:task/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../helper/api_url.dart';
import '../../helper/dio_helper.dart';
import '../LoginScreen.dart';
import '../model/loginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  DioHelper _dioHelper = DioHelper();
  LoginModel loginModel = LoginModel();

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final response = await _dioHelper.postData(
        path: ApiUrl.login,
        body: {
          "email": email,
          "password": password,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        Get.offAll(VerticalSliderDemo());
        emit(LoginSuccessState());
      } else {
        Get.snackbar("Error", loginModel.message ?? "",
            backgroundColor: Colors.red);
        emit(LoginErrorState());
      }
    } catch (e) {
      emit(LoginErrorState());
    }
  }
}
