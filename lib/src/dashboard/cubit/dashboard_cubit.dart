import 'dart:convert';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dashboard/model/dashboard_response.dart';

part 'dashboard_state.dart';

/// State management of [DashboardState].
class DashboardCubit extends Cubit<DashboardState> {
  /// Set whatever active state of [DashboardState] at the time.
  DashboardCubit() : super(DashboardLoading()) {
    fetch();
  }

  /// Fetching articles.
  fetch() async {
    // While waiting, set state as [DashboardLoading].
    emit(DashboardLoading());

    // Do GET to fetch response.
    final Response response = await get(
        Uri.parse('https://demo.treblle.com/api/v1/articles'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB',
        });

    try {
      // Decode [Response] to [DashboardResponse].
      DashboardResponse output =
          DashboardResponse.fromJson(jsonDecode(response.body));

      // If the conditions are met return [DashboardLoaded].
      if (output.status == true && output.code == 200) {
        emit(DashboardLoaded(response: output));
      }

      // Condition doesn't fulfilled, set state as [DashboardError].
      else {
        emit(DashboardError(message: 'Status code ${output.code}'));
      }
    }
    // Catch exception of decoding [Response].
    catch (e) {
      // Set state as [DashboardError].
      emit(DashboardError(message: e.toString()));
    }
  }
}
