import 'package:drift/drift.dart';
import 'package:fit_rush_app/database/converters/user_goal_type_converter.dart';

class UsersTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uid => text();
  TextColumn get name => text()();
  IntColumn get age => integer().nullable()();
  TextColumn get gender => text().nullable()();
  RealColumn get height => real().nullable()();
  RealColumn get weight => real().nullable()();
  TextColumn get longTermGoal => text().map(const UserGoalTypeConverter())();
  TextColumn get dailyGoal => text().map(const UserGoalTypeConverter())();
}
