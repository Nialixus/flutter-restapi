import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restapi_sample/src/misc/readablestring.dart';

/// Opened after user authentication.
///
/// showing list of data from Rest API.
class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double padding = width * 0.05;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.canvasColor,
      // Dashboard's header.
      appBar: _header(theme: theme),

      // Dashboard's body.
      body: Column(
        children: [
          // Horizontal list.
          Container(
            margin: EdgeInsets.symmetric(horizontal: padding),
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, x) => _horItem(
                      isLast: x == 9,
                      padding: padding,
                      theme: theme,
                    )),
          ),

          // Vertical list.
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(padding),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, x) => _verItem(
                      isLast: x == 9,
                      padding: padding,
                      theme: theme,
                      width: width,
                    )),
          ))
        ],
      ),
    );
  }
}

/// Header of [Dashboard].
PreferredSizeWidget _header({required ThemeData theme}) {
  return AppBar(
      elevation: 0.0,
      shadowColor: Colors.transparent,
      backgroundColor: theme.canvasColor,
      title: Text.rich(TextSpan(children: [
        for (int x = 0; x < 2; x++)
          TextSpan(
              text: ['Welcome, ', 'User'][x],
              style: TextStyle(
                color: Colors.black,
                fontWeight: [FontWeight.normal, FontWeight.bold][x],
              ))
      ])));
}

/// Horizontal item of [Dashboard].
Widget _horItem(
    {required bool isLast, required ThemeData theme, required double padding}) {
  return Container(
      width: 200,
      margin: EdgeInsets.only(
        right: isLast ? 0.0 : padding,
      ),
      padding: EdgeInsets.all(padding / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            width: 1,
            color: theme.primaryColor,
          )),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Horizontal Item's Title.
            Text('title',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                )),

            // Horizontal Item's Content.
            const Expanded(
                child: Text(
              'subtitlse',
              overflow: TextOverflow.ellipsis,
            ))
          ]));
}

/// Vertical item of [Dashboard].
Widget _verItem(
    {required ThemeData theme,
    required double padding,
    required double width,
    required bool isLast}) {
  return Container(
      decoration: BoxDecoration(
          color: theme.cardColor, borderRadius: BorderRadius.circular(5.0)),
      margin: EdgeInsets.only(bottom: isLast ? 0.0 : padding),
      padding: EdgeInsets.all(padding / 2),
      height: 200,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Vertical Item's Cover & Title.
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SvgPicture.asset(
            'assets/cover.svg',
            width: width * 0.2,
            height: width * 0.2,
          ),
          SizedBox(width: padding / 2),
          const Expanded(child: Text('text'))
        ]),

        // Vertical Item's Content.
        Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: padding / 2),
              child: const Text('data')),
        ),

        // Vertical Item's Date.
        Align(
            alignment: Alignment.centerRight,
            child: Text(DateTime.now().toReadableString)),
      ]));
}
