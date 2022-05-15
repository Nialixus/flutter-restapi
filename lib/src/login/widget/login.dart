import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';
import '../../dashboard/widgets/dashboard.dart';
import '../../dashboard/cubit/dashboard_cubit.dart';

part 'login_listener.dart';

/// Login page.
///
/// First page of this entire app, processing user authentication.
class Login extends StatelessWidget {
  /// Initial page of entire app.
  Login({Key? key}) : super(key: key);

  /// Controller to fetch email text.
  final TextEditingController email = TextEditingController();

  /// Controller to fetch password text.
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.05;
    ThemeData theme = Theme.of(context);

    return LoginListener(
        child: Scaffold(
            body: CustomScrollView(shrinkWrap: true, slivers: [
      // Login's header.
      SliverAppBar(
          floating: true,
          elevation: 0.0,
          centerTitle: true,
          title: const Text('My APPS'),
          toolbarHeight: kToolbarHeight * 1.75,
          backgroundColor: theme.canvasColor,
          titleTextStyle: TextStyle(
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
          )),

      // Login's body.
      SliverList(
          delegate: SliverChildListDelegate([
        // Illustration.
        SvgPicture.asset('assets/illustration.svg'),

        // Textfields.
        for (int x = 0; x < 2; x++)
          Container(
              margin: EdgeInsets.fromLTRB(padding, [kToolbarHeight, padding][x],
                  padding, [0.0, kToolbarHeight][x]),
              padding: EdgeInsets.symmetric(horizontal: padding / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: theme.backgroundColor),
              child: TextField(
                obscureText: [false, true][x],
                controller: [email, password][x],
                decoration: InputDecoration(
                    suffixIcon: x == 0
                        ? null
                        : Icon(
                            Icons.remove_red_eye_sharp,
                            color: theme.primaryColor,
                          ),
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: theme.primaryColor),
                    labelText: ['Username', 'Password'][x]),
              )),

        // Login button.
        Padding(
            padding: EdgeInsets.fromLTRB(padding, 0, padding, kToolbarHeight),
            child: MaterialButton(
                onPressed: () => context
                    .read<LoginCubit>()
                    .auth(email: email.text, password: password.text),
                height: kToolbarHeight,
                color: theme.primaryColor,
                child: Text('LOGIN',
                    style: TextStyle(
                      color: theme.canvasColor,
                      fontWeight: FontWeight.bold,
                    ))))
      ]))
    ])));
  }
}
