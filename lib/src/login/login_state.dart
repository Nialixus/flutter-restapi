import 'package:equatable/equatable.dart';
import 'package:restapi_sample/src/login/login_model.dart';

abstract class LoginState extends Equatable {}

class LoginAuthenticatingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSucceedState extends LoginState {
  LoginSucceedState(this.model);

  final List<LoginInput> model;

  @override
  List<Object> get props => [model];
}

class LoginFailedState extends LoginState {
  @override
  List<Object> get props => [];
}
