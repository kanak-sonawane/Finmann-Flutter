import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date) =>
      DateFormat('dd MMM yyyy').format(date);

  static String formatMonth(DateTime date) =>
      DateFormat('MMMM yyyy').format(date);

  static String formatShort(DateTime date) =>
      DateFormat('dd MMM').format(date);

  static String formatDay(DateTime date) =>
      DateFormat('EEE, dd MMM').format(date);

  static bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static bool isToday(DateTime date) => isSameDay(date, DateTime.now());

  static bool isYesterday(DateTime date) =>
      isSameDay(date, DateTime.now().subtract(const Duration(days: 1)));

  static String smartFormat(DateTime date) {
    if (isToday(date)) return 'Today';
    if (isYesterday(date)) return 'Yesterday';
    return formatDay(date);
  }
}
