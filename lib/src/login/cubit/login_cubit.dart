import 'dart:convert';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_response.dart';

part 'login_state.dart';

/// State Management for [LoginState].
class LoginCubit extends Cubit<LoginState> {
  /// Stating what state is [LoginState] at the moment.
  LoginCubit() : super(LoginInit());

  /// Authenticating user's.
  auth({required String email, required String password}) async {
    // Set state as [LoginLoading].
    emit(LoginLoading());
    // Do POST to get response.
    final Response response = await post(
      Uri.parse('https://demo.treblle.com/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    try {
      // Decode [Response] to [LoginOutput].
      LoginResponse output = LoginResponse.fromJson(jsonDecode(response.body));

      // If the conditions are met return [LoginSucceed].
      //
      // Set state as [LoginSucceed].
      if (output.status == true && output.code == 200) {
        emit(LoginSucceed(response: output));
      }

      // Set state as [LoginFailed].
      else {
        emit(LoginFailed(message: 'Code ${output.code} : Login Failed'));
      }
    }
    // Set state as [LoginFailed].
    catch (e) {
      // Whether email requirement is fulfilled or not.
      bool emailReq =
          email.contains('@') ? email.split('@').last.isNotEmpty : false;

      // Whether password requirement is fulfilled or not.
      bool passReq = password.length >= 5;

      // A couple case of what message should be displayed.
      String message() {
        if (emailReq && !passReq) {
          return 'Password is invalid';
        } else if (!emailReq && passReq) {
          return 'Email is invalid';
        } else if (!emailReq && !passReq) {
          return 'Both Email and Password are invalid';
        } else {
          return e.toString();
        }
      }

      // Set state as [LoginFailed].
      emit(LoginFailed(message: message()));
    }
  }
}
