import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restapi_sample/src/dashboard/dashboard.dart';

import 'login_cubit.dart';
import 'login_state.dart';

/// Login page.
///
/// First page of this entire app, processing user authentication.
class Login extends StatelessWidget {
  const Login({Key? key, required this.email, required this.password})
      : super(key: key);

  /// Controller to fetch text result.
  final TextEditingController email, password;

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.05;
    ThemeData theme = Theme.of(context);
    bool obscure = true;

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
                obscureText: [false, obscure][x],
                controller: [email, password][x],
                decoration: InputDecoration(
                    suffixIcon: x == 0
                        ? null
                        : GestureDetector(
                            onTap: () {
                              log(password.hasListeners.toString());
                            },
                            child: Icon(
                              Icons.remove_red_eye_sharp,
                              color: theme.primaryColor,
                            ),
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

/// Separating [BlocListener] from [Login].
class LoginListener extends StatelessWidget {
  /// A widget to listen [LoginCubit].
  const LoginListener({Key? key, required this.child}) : super(key: key);

  /// [BlocListener]'s child.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => previous != current,
      listener: (listen, state) {
        // [LoginLoading] displaying circular icon
        if (state is LoginLoading) {
          showDialog(
              context: listen,
              barrierDismissible: false,
              builder: (listen) => const Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 7.5,
                      color: Color(0xff21BDC6),
                      backgroundColor: Color(0xff384647))));
        }
        // [LoginSucceed] redirecting user to [Dashboard].
        else if (state is LoginSucceed) {
          Navigator.pop(listen);
          Navigator.pop(context);
          Navigator.push(listen,
              MaterialPageRoute(builder: (listen) => const Dashboard()));
        }
        // [LoginFailed] displaying alert message.
        else if (state is LoginFailed) {
          Navigator.pop(listen);
          showDialog(
              context: listen,
              builder: (listen) => AlertDialog(content: Text(state.message)));
        }
      },
      child: child,
    );
  }
}
