import 'package:drift/drift.dart';
import 'package:fit_rush_app/database/converters/user_goal_type_converter.dart';

class UsersTable extends Table {
  TextColumn get uid => text()(); // Firebase UID
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get profileImageUrl => text().nullable()();
  IntColumn get age => integer().nullable()();
  TextColumn get gender => text().nullable()();
  RealColumn get height => real().nullable()();
  RealColumn get weight => real().nullable()();
  TextColumn get longTermGoal => text().map(const UserGoalTypeConverter())();
  TextColumn get dailyGoal => text().map(const UserGoalTypeConverter())();

  @override
  Set<Column> get primaryKey => {uid};

  @override
  List<Set<Column>> get uniqueKeys => [
    {email},
  ];
}
