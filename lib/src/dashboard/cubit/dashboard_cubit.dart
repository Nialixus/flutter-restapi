import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_sample/src/dashboard/model/dashboard_response.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardLoading()) {
    fetch();
  }

  /// Fetching articles.
  fetch() async {
    emit(DashboardLoading());
    // Do POST to get response.
    final Response response = await get(
        Uri.parse('https://demo.treblle.com/api/v1/articles'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB',
        });

    try {
      // Decode [Response] to [LoginOutput].
      DashboardResponse output =
          DashboardResponse.fromJson(jsonDecode(response.body));

      // If the conditions are met return [LoginSucceed].
      //
      // Set state as [LoginSucceed].
      if (output.status == true && output.code == 200) {
        emit(DashboardLoaded(response: output));
      }

      // Set state as [LoginFailed].
      else {
        emit(DashboardError(message: 'Status code ${output.code}'));
      }
    }
    // Set state as [LoginFailed].
    catch (e) {
      // Set state as [LoginFailed].
      emit(DashboardError(message: e.toString()));
    }
  }
}
