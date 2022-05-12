/// Make a shortcut of converting [DateTime] to structured [String].
extension DateTimeExtension on DateTime {
  /// Convert [DateTime] to structured string.
  ///
  /// ```dart
  /// String readableDate = DateTime(1975).toReadableString;
  /// print(readableDate) // 1 Januari 1975, 0:0:0
  /// ```
  String get toReadableString => dateToString(this);
}

/// A method of converting [DateTime] to structure string.
String dateToString(DateTime dateTime) {
  /// List of months in indonesian.
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
  assert(months.length == 12);

  return '${dateTime.day} ${months[dateTime.month - 1]} ${dateTime.year}, ${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
}
