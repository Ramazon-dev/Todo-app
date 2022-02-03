import 'package:hive/hive.dart';

part 'reminders.g.dart';

@HiveType(typeId: 1)
class Reminders {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String day;

  @HiveField(2)
  final DateTime dateTime;

  Reminders({
    required this.name,
    required this.day,
    required this.dateTime,
  });
}
