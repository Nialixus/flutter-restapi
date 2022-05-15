import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../misc/datetostring.dart';
import '../cubit/dashboard_cubit.dart';
import '../model/dashboard_response.dart';

part 'dashboard_header.dart';
part 'dashboard_vertical.dart';
part 'dashboard_horizontal.dart';

/// Opened after user authentication.
///
/// showing list of [DashboardArticle] from Rest API.
class Dashboard extends StatelessWidget {
  /// Dashboard page for user.
  const Dashboard({Key? key, required this.name}) : super(key: key);

  /// Name that passed from [Login].
  final String name;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);
    double padding = width * 0.05;

    return BlocBuilder<DashboardCubit, DashboardState>(
        builder: (cubitContext, state) {
      // Displaying error widget.
      if (state is DashboardError) {
        return Scaffold(body: Center(child: Text(state.message)));
      }

      // Displaying either loading or loaded widget.
      else {
        return Scaffold(
            backgroundColor: theme.canvasColor,
            // Dashboard's header.
            appBar: AppBar(
                elevation: 0.0,
                automaticallyImplyLeading: false,
                shadowColor: Colors.transparent,
                backgroundColor: theme.canvasColor,
                title: state is DashboardLoaded
                    ? DashboardHeader.loaded(name: name)
                    : DashboardHeader.loading(theme: theme)),

            // Dashboard's body.
            body: Column(children: [
              // Horizontal list.
              Container(
                  margin: EdgeInsets.symmetric(horizontal: padding),
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state is DashboardLoaded
                          ? state.response.articles.length
                          : 5,
                      itemBuilder: (_, x) {
                        if (state is DashboardLoaded) {
                          List<DashboardArticle> articles =
                              state.response.articles;

                          return DashboardHorizontal.loaded(
                            theme: theme,
                            padding: padding,
                            title: articles[x].title,
                            content: articles[x].content,
                            isLast: x == articles.length - 1,
                          );
                        } else {
                          return DashboardHorizontal.loading(
                            theme: theme,
                            isLast: x == 4,
                            padding: padding,
                          );
                        }
                      })),

              // Vertical list.
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: ListView.builder(
                          itemCount: state is DashboardLoaded
                              ? state.response.articles.length
                              : 5,
                          itemBuilder: (_, x) {
                            if (state is DashboardLoaded) {
                              List<DashboardArticle> articles =
                                  state.response.articles;

                              return DashboardVertical.loaded(
                                theme: theme,
                                width: width,
                                padding: padding,
                                title: articles[x].title,
                                cover: articles[x].image,
                                content: articles[x].content,
                                isLast: x == articles.length - 1,
                                createdDate: articles[x].createdDate,
                              );
                            } else {
                              return DashboardVertical.loading(
                                theme: theme,
                                width: width,
                                isLast: x == 4,
                                padding: padding,
                              );
                            }
                          })))
            ]));
      }
    });
  }
}
