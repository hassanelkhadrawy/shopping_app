import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/Data/Models/login_model.dart';
import 'package:shopping_app/Data/WebServices/webservices.dart';
import 'package:shopping_app/constants/Strings/strings.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  late LoginModel loginModel;

  static LoginCubit get(context) => BlocProvider.of(context);

  void GetLoginData({required String email, required String password}) {
    emit(LoginLoading());
    WebServices().PostData(
        url: LoginUrl,
        data: {'email': email, 'password': password}).then((value) {
      loginModel=LoginModel.fromjson(value.data);
      emit(LoginSuccess(loginModel));

    }).catchError((onError) {
      emit(LoginFailed(onError.toString()));
      print(onError);
    });
  }

  bool isPassword = false;
  Icon suffixIcon = Icon(Icons.visibility_outlined);

  void ShowingPassword() {
    isPassword = !isPassword;
    suffixIcon = isPassword
        ? Icon(Icons.visibility_outlined)
        : Icon(Icons.visibility_off_outlined);

    emit(ChangeShowPasswordState());
  }
}
