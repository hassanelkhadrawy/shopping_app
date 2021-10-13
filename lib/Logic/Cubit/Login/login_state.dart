part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  late LoginModel loginModel;

  LoginSuccess(this.loginModel);
}
class LoginFailed extends LoginState {
  String? error;
  LoginFailed(this.error);
}
class ChangeShowPasswordState extends LoginState {}


