part of 'dashboard.dart';

/// Header for [Dashboard].
class DashboardHeader {
  /// Displayed [name] that passed from [Login] when [DashboardArticle] sucessfully fetched.
  static Widget loaded({required String name}) => Text.rich(TextSpan(children: [
        for (int x = 0; x < 2; x++)
          TextSpan(
              text: ['Welcome, ', name][x],
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: [FontWeight.normal, FontWeight.bold][x]))
      ]));

  /// Displayed while device fetching [DashboardArticle].
  static Widget loading({required ThemeData theme}) {
    Text text = Text.rich(TextSpan(children: [
      for (int x = 0; x < 2; x++)
        TextSpan(
            text: ['Welcome, ', 'User'][x],
            style: TextStyle(
              color: Colors.black,
              fontWeight: [FontWeight.normal, FontWeight.bold][x],
            ))
    ]));

    // Displaying shimmering widget.
    return LayoutBuilder(builder: (_, layout) {
      TextPainter painter = TextPainter(
        text: text.textSpan,
        textDirection: text.textDirection ?? TextDirection.ltr,
      )..layout(
          minWidth: layout.minWidth,
          maxWidth: layout.maxWidth,
        );

      return SizedBox(
          width: painter.width,
          height: painter.height,
          child: LinearProgressIndicator(
            color: theme.canvasColor,
            backgroundColor: theme.primaryColorLight,
          ));
    });
  }
}
