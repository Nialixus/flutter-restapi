import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_sample/src/dashboard/widgets/dashboard.dart';

import 'src/login/widget/login.dart';
import 'src/login/cubit/login_cubit.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Rest API Demo',
      debugShowCheckedModeBanner: false,
      color: const Color(0xff247881),
      theme: ThemeData(
        cardColor: const Color(0xffDEEBEC),
        canvasColor: const Color(0xffffffff),
        primaryColor: const Color(0xff247881),
        backgroundColor: const Color(0xffBDD6D9),
        primaryColorDark: const Color(0xffC8C7C7),
        primaryColorLight: const Color(0xffF8F7F7),
      ),
      home: BlocProvider(
        create: (_) => LoginCubit(),
        child: const Dashboard(),
      )));
}
