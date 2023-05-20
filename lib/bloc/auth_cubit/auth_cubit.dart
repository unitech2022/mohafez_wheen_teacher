import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:mohafez_elwaheen_teacher/core/data/data.dart';
import 'package:mohafez_elwaheen_teacher/models/usel_model.dart';
import 'package:page_transition/page_transition.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../core/api_constatns.dart';
import '../../core/app_model.dart';
import '../../core/enums.dart';
import '../../core/helpers/helper_functions.dart';
import '../../persintaion/ui/home_screen/home_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  /// login method

  Future userLogin({userName, pass, context}) async {
    emit(state.copyWith(
      loginUserState: RequestState.loading,
    ));
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiConstants.loginPath));
    request.fields.addAll(
        {'DeviceToken': 'ffffffff', 'Email': userName, 'password': pass});

    http.StreamedResponse response = await request.send();
    if (kDebugMode) {
      print("${response.statusCode} ======> loginUser");
    }

    if (response.statusCode == 200) {
      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);
      UserResponse userResponseModel = UserResponse.fromJson(jsonData);

      token = "Bearer ${userResponseModel.token}";

      currentUser.fullName = userResponseModel.user!.fullName;
      currentUser.userName = userResponseModel.user!.userName;
      currentUser.id = userResponseModel.user!.id;
      currentUser.country = userResponseModel.user!.country;
      currentUser.profileImage = userResponseModel.user!.profileImage??"NOT";
      currentUser.deviceToken = userResponseModel.user!.deviceToken;
      currentUser.role = userResponseModel.user!.role;

      await saveToken(tokenAdd: token);

      pushPageTransition(
          context: context,
          page: const HomeScreen(),
          type: PageTransitionType.rightToLeft);
      emit(state.copyWith(
          loginUserState: RequestState.loaded,
          userResponseModel: userResponseModel));
    } else if (response.statusCode == 401) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Color.fromARGB(255, 211, 161, 11),
            message: "الرقم غير مسجل عندنا",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      emit(state.copyWith(
        loginUserState: RequestState.loaded,
      ));
    } else {
      emit(state.copyWith(
        loginUserState: RequestState.error,
      ));
    }
  }

  /// register method

  Future register({context, email, name, gander, country, pass}) async {
    emit(state.copyWith(registerUserState: RequestState.loading));
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiConstants.registerPath));
    request.fields.addAll({
      'userName': email,
      'FullName': name,
      'gender': gander,
      'Password': 'Abc123@',
      'Role': 'user',
      "profileImage":"not",
      'Country': country,
      'Email': email,
      'code': pass
    });

    http.StreamedResponse response = await request.send();

    if (kDebugMode) {
      print("${response.statusCode} ======> register");
    }
    if (response.statusCode == 200) {
      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);
  
      ResponseRegister responseRegister = ResponseRegister.fromJson(jsonData);

      if (responseRegister.status) {
        await userLogin(context: context, userName: email,pass: pass);

        emit(state.copyWith(registerUserState: RequestState.loaded));
      }
    } else if (response.statusCode == 400) {
      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);
      ResponseRegister responseRegister = ResponseRegister.fromJson(jsonData);
      showTopMessage(
          context: context,
          customBar: CustomSnackBar.error(
              backgroundColor: Colors.red,
              message: responseRegister.message,
              textStyle: const TextStyle(
                  fontFamily: "font", fontSize: 16, color: Colors.white)));
      emit(state.copyWith(registerUserState: RequestState.loaded));
    } else {
      emit(state.copyWith(registerUserState: RequestState.error));
    }
  }

  CountryModel? currentGender;
  CountryModel? currentCountry;
  changeDopDawn(int type, CountryModel value) {
    if (type == 1) {
      currentGender = value;
    }else{
        currentCountry = value;
    }

    emit(state.copyWith(selectDropState: RequestState.loaded));
  }
}
