part of 'dashboard.dart';

/// A widget to display [DashboardArticle] in vertical.
class DashboardVertical {
  /// Displayed while device fetching [DashboardArticle].
  static Widget loading({
    required bool isLast,
    required double width,
    required double padding,
    required ThemeData theme,
  }) {
    return Container(
        height: 200,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(bottom: isLast ? 0.0 : padding),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        child: Stack(children: [
          // Background wrapper with loading animation.
          Positioned.fill(
              child: LinearProgressIndicator(
                  backgroundColor: theme.primaryColorLight,
                  color: theme.canvasColor)),

          Padding(
              padding: EdgeInsets.all(padding / 2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Cover
                          Container(
                            width: width * 0.2,
                            height: width * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: theme.primaryColorDark),
                          ),

                          // Title
                          Expanded(
                              child: Container(
                            height: width * 0.1,
                            margin: EdgeInsets.only(left: padding / 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: theme.primaryColorDark),
                          ))
                        ]),

                    // Content
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: padding / 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: theme.primaryColorDark),
                      ),
                    ),

                    // DateTime
                    Align(
                        alignment: Alignment.centerRight,
                        child: LayoutBuilder(builder: (_, constraints) {
                          TextPainter painter = TextPainter(
                            textDirection: TextDirection.ltr,
                            text:
                                TextSpan(text: DateTime.now().toReadableString),
                          )..layout(
                              maxWidth: constraints.maxWidth,
                              minWidth: constraints.minWidth);
                          return Container(
                              width: painter.width,
                              height: painter.height,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: theme.primaryColorDark));
                        }))
                  ]))
        ]));
  }

  /// Displayed when [DashboardArticle] sucessfully fetched.
  static Widget loaded({
    required bool isLast,
    required double width,
    required String cover,
    required String title,
    required double padding,
    required String content,
    required ThemeData theme,
    required DateTime createdDate,
  }) {
    return Container(
        decoration: BoxDecoration(
            color: theme.cardColor, borderRadius: BorderRadius.circular(5.0)),
        margin: EdgeInsets.only(bottom: isLast ? 0.0 : padding),
        padding: EdgeInsets.all(padding / 2),
        height: 200,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Cover
            Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(right: padding / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Image.network(cover,
                    width: width * 0.2,
                    height: width * 0.2,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        SvgPicture.asset(
                          'assets/cover.svg',
                          width: width * 0.2,
                          height: width * 0.2,
                        ))),

            // Title
            Expanded(child: Text(title)),
          ]),

          // Content
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: padding / 2),
                  child: Text(content))),

          // DateTime
          Align(
              alignment: Alignment.centerRight,
              child: Text(createdDate.toReadableString))
        ]));
  }
}
