import 'package:intl/intl.dart';

class StringUtil {
  static String setCaptialized(String s) {
    return s
        .split('_')
        .map((word) => toBeginningOfSentenceCase(word))
        .join(' ');
  }
}
