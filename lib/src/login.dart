import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Login page.
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          /// Login's header.
          SliverAppBar(
              floating: true,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              toolbarHeight: kToolbarHeight * 1.75,
              title: const Text('My APPS'),
              titleTextStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              )),

          /// Login's body.
          SliverList(
            delegate: SliverChildListDelegate(
              [
                /// Illustration.
                SvgPicture.asset('assets/illustration.svg'),

                /// Textfields.
                for (int x = 0; x < 2; x++)
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color.fromRGBO(189, 214, 217, 1)),
                    child: TextField(
                      decoration: InputDecoration(
                          hoverColor: Colors.blue,
                          fillColor: Colors.red,
                          prefixText: ['Username', 'Password'][x]),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
