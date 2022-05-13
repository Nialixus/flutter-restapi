import 'dart:convert';
import 'dart:developer';
import 'package:restapi_sample/src/login/login_model.dart';

import 'login_state.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

/*
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
}*/

void auth(LoginInput input) async {
  // Do POST to get response.
  final http.Response response = await http.post(
    Uri.parse('https://demo.treblle.com/api/v1/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB',
    },
    body: jsonEncode(<String, String>{
      'email': input.email,
      'password': input.password,
    }),
  );

  // Decode [Response] to [LoginOutput].
  LoginOutput output = LoginOutput.fromJson(jsonDecode(response.body));

  log(output.phoneNumber);

  /*

  LoginResponse.fromJson(response.body);

  if (response) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }*/

/*
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }*/
}
