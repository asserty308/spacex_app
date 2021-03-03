part of 'launch.dart';

enum DatePrecision {
  half, quarter, year, month, day, hour
}

class DatePrecisionUtil {
  static DatePrecision? fromString(String? value) {
    final Map<String, DatePrecision> dict = {
      'half': DatePrecision.half,
      'quarter': DatePrecision.quarter,
      'year': DatePrecision.year,
      'month': DatePrecision.month,
      'day': DatePrecision.day,
      'hour': DatePrecision.hour,
    };

    return dict[value!];
  }
}