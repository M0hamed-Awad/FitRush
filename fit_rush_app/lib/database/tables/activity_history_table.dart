import 'package:drift/drift.dart';

class ActivityHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  IntColumn get exerciseId => integer().nullable()();
  TextColumn get source => text()(); // e.g., 'manual', 'google_fit'
  DateTimeColumn get date => dateTime()();
  IntColumn get duration => integer().nullable()(); // in minutes
  IntColumn get steps => integer().nullable()();
  RealColumn get distance => real().nullable()(); // in meters
  RealColumn get calories => real()(); // always stored
  TextColumn get notes => text().nullable()();
}
