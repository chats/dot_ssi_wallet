import 'package:intl/intl.dart';

class DateTimeUtil {
  static String toExpiryDate(String d, {String locale = 'en_US'}) {
    final dd = int.parse(d.substring(6, 8));
    final mm = int.parse(d.substring(4, 6));
    final yyyy = int.parse(d.substring(0, 4));
    return DateFormat('d MMM yyyy', locale).format(DateTime(yyyy, mm, dd));
  }
}
