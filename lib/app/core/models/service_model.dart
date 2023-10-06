// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../utils/day_week_enum.dart';

class ServiceModel {
  final DayWeekEnum dayOfTheWeek;
  final List<String> hours;
  ServiceModel({
    required this.dayOfTheWeek,
    required this.hours,
  });

  ServiceModel copyWith({
    DayWeekEnum? dayOfTheWeek,
    List<String>? hours,
  }) {
    return ServiceModel(
      dayOfTheWeek: dayOfTheWeek ?? this.dayOfTheWeek,
      hours: hours ?? this.hours,
    );
  }
}
