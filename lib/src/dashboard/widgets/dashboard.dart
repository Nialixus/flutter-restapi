import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restapi_sample/src/misc/datetostring.dart';

import '../cubit/dashboard_cubit.dart';

part 'dashboard_header.dart';
part 'dashboard_vertical.dart';

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

    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (cubitContext, state) {
          if (state is DashboardError) {
            return Scaffold(body: Center(child: Text(state.message)));
          } else {
            return Scaffold(
              backgroundColor: theme.canvasColor,
              // Dashboard's header.
              appBar: AppBar(
                  elevation: 0.0,
                  automaticallyImplyLeading: false,
                  shadowColor: Colors.transparent,
                  backgroundColor: theme.canvasColor,
                  title: state is DashboardLoaded
                      ? DashboardHeader.loaded(user: "Rajib")
                      : DashboardHeader.loading(theme: theme)),

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
                        itemCount: state is DashboardLoaded
                            ? state.response.articles.length
                            : 5,
                        itemBuilder: (_, x) => DashboardVertical.loading(
                              width: width,
                              isLast: x ==
                                  (state is DashboardLoaded
                                      ? state.response.articles.length
                                      : 5),
                              padding: padding,
                              theme: theme,
                            )),
                  ))
                ],
              ),
            );
          }
        },
      ),
    );
  }
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
