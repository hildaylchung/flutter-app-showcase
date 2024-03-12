// Package imports:
import 'package:get_time_ago/get_time_ago.dart';

/// removed the suffix 'ago'
class CustomDateString implements Messages {
  @override
  String prefixAgo() => '';

  @override
  String suffixAgo() => '';

  @override
  String secsAgo(int seconds) => '$seconds seconds';

  @override
  String minAgo(int minutes) => 'a minute';

  @override
  String minsAgo(int minutes) => '$minutes minutes';

  @override
  String hourAgo(int minutes) => 'an hour';

  @override
  String hoursAgo(int hours) => '$hours hours';

  @override
  String dayAgo(int hours) => 'a day';

  @override
  String daysAgo(int days) => '$days days';

  @override
  String wordSeparator() => ' ';
}

String formatDateAgo(DateTime d) {
  final now = DateTime.now();
  if (d.isAfter(now)) {
    return '';
  }
  return GetTimeAgo.parse(d);
}
