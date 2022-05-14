part of 'dashboard.dart';

/// Headers for [Dashboard].
class DashboardHeader {
  static Widget loaded({required String user}) => Text.rich(TextSpan(children: [
        for (int x = 0; x < 2; x++)
          TextSpan(
              text: ['Welcome, ', user][x],
              style: TextStyle(
                color: Colors.black,
                fontWeight: [FontWeight.normal, FontWeight.bold][x],
              ))
      ]));

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

    return LayoutBuilder(builder: (_, layout) {
      TextPainter painter = TextPainter(
          text: text.textSpan,
          textDirection: text.textDirection ?? TextDirection.ltr)
        ..layout(
          minWidth: layout.minWidth,
          maxWidth: layout.maxWidth,
        );

      return SizedBox(
          width: painter.width,
          height: painter.height,
          child: LinearProgressIndicator(
            color: theme.primaryColorDark,
            backgroundColor: theme.primaryColorLight,
          ));
    });
  }
}
