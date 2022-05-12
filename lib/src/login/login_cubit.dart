import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  void authenticate() {
    emit(LoginSucceed('This is new Data ${Random().nextInt(100)}'));
  }
}
