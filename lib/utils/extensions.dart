extension DateFormat on DateTime {
  String format() {
    // get in the format of yyyy-MM-dd
    return '$year-$month-$day';
  }
}
