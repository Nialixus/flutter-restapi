import 'dart:convert';

import 'package:http/http.dart';

import 'login_model.dart';
import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInit());

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
      if (output.status == true && output.code == 200) {
        // Set state as [LoginSucceed].
        emit(LoginSucceed(response: output));
      }

      // Else return [LoginFailed].
      else {
        // Set state as [LoginFailed].
        emit(LoginFailed(message: '${output.code} Login Failed'));
      }
    } catch (e) {
      // Set state as [LoginFailed].
      emit(LoginFailed(message: e.toString()));
    }
  }
}
