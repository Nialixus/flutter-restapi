import 'package:flutter/material.dart';

import 'src/login/login.dart';
import '/src/dashboard/dashboard.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Rest API Demo',
    debugShowCheckedModeBanner: false,
    color: const Color(0xff247881),
    theme: ThemeData(
        cardColor: const Color(0xffDEEBEC),
        canvasColor: const Color(0xffffffff),
        primaryColor: const Color(0xff247881),
        backgroundColor: const Color(0xffBDD6D9)),
    home: const Dashboard(),
  ));
}
