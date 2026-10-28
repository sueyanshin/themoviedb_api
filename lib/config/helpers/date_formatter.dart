import 'package:intl/intl.dart';

class DateFormatter {
  static String formatString(String dateString) {
    try {
      DateFormat inputFormat = DateFormat("yyyy-M-d");
      DateTime parseDate = inputFormat.parse(dateString);
      return DateFormat("MMMM d, yyyy").format(parseDate);
    } catch (e) {
      return "Invalid date format";
    }
  }
}
