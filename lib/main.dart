import 'package:flutter/material.dart';

import '/src/login.dart';

void main() {
  runApp(Theme(
    data: ThemeData(
      primaryColor: const Color(0xff247881),
      backgroundColor: const Color(0xffBDD6D9),
    ),
    child: Builder(builder: (context) {
      /// Get themedata from parent.
      ThemeData appTheme = Theme.of(context);

      /// Run widget.
      return MaterialApp(
        title: 'Flutter Rest API Demo',
        theme: appTheme,
        color: appTheme.primaryColor,
        home: const Login(),
      );
    }),
  ));
}
