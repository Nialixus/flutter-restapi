part of 'dashboard.dart';

/// A widget to display [DashboardArticle] in horizontal.
class DashboardHorizontal {
  /// Displayed while device fetching [DashboardArticle].
  static Widget loading({
    required bool isLast,
    required double padding,
    required ThemeData theme,
  }) {
    return Container(
        width: 200,
        margin: EdgeInsets.only(
          right: isLast ? 0.0 : padding,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              LayoutBuilder(builder: (_, constraints) {
                TextPainter painter = TextPainter(
                    textDirection: TextDirection.ltr,
                    text: const TextSpan(text: 'Sample title'))
                  ..layout(
                      maxWidth: constraints.maxWidth,
                      minWidth: constraints.minWidth);
                return Container(
                    width: painter.width,
                    height: painter.height,
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: LinearProgressIndicator(
                        backgroundColor: theme.primaryColorLight,
                        color: theme.canvasColor));
              }),

              // Content
              Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: LinearProgressIndicator(
                          backgroundColor: theme.primaryColorLight,
                          color: theme.canvasColor)))
            ]));
  }

  /// Displayed when [DashboardArticle] sucessfully fetched.
  static Widget loaded({
    required bool isLast,
    required String title,
    required String content,
    required double padding,
    required ThemeData theme,
  }) {
    return Container(
        width: 200,
        margin: EdgeInsets.only(
          right: isLast ? 0.0 : padding,
        ),
        padding: EdgeInsets.all(padding / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(width: 1, color: theme.primaryColor)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: theme.primaryColor, fontWeight: FontWeight.bold)),

              //  Content
              Expanded(child: Text(content))
            ]));
  }
}
