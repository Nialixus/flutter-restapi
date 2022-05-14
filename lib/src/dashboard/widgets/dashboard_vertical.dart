part of 'dashboard.dart';

class DashboardVertical {
  static Widget loading(
      {required ThemeData theme,
      required double width,
      required double padding,
      required bool isLast}) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(padding / 2),
      margin: EdgeInsets.only(bottom: isLast ? 0.0 : padding),
      decoration: BoxDecoration(
        color: theme.primaryColorLight,
        borderRadius: BorderRadius.circular(5.0),
      ),
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
      ]),
    );
  }

  static Widget loaded(
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
}
