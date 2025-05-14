import 'package:drift/drift.dart';
import 'package:fit_rush_app/database/converters/exercise_type_converter.dart';

class ExercisesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get name => text()();
  TextColumn get type => text().map(const ExerciseTypeConverter())();
  IntColumn get duration => integer().nullable()();
  IntColumn get repetitions => integer().nullable()();
  RealColumn get calories => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// icon → to store a visual hint

// description

// or isFavorite → to mark template favorites
