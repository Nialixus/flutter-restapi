export 'datetostring.dart' hide dateToString;

/// Shortcut for converting [DateTime] to structured [String].
extension DateTimeExtension on DateTime {
  /// Convert [DateTime] to structured [String].
  ///
  /// ```dart
  /// String readableDate = DateTime(1975).toReadableString;
  /// print(readableDate) // 1 Januari 1975, 0:0:0
  /// ```
  String get toReadableString => dateToString(this);
}

/// A method for converting [DateTime] to structured [String].
String dateToString(DateTime dateTime) {
  // List of months in indonesian.
  List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];
  // Gotta make sure how many months in list.
  assert(months.length == 12);

  return '${dateTime.day} ${months[dateTime.month - 1]} ${dateTime.year}, ${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
}
