import 'dart:collection';

import 'package:mental_health_application/utilities/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class Goal {
  final String title;
  DateTime timeCreated;

  Goal({required this.title, required this.timeCreated});

  @override
  String toString() => title;
}
