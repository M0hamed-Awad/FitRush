import 'package:drift/drift.dart';
import 'package:fit_rush_app/models/exercise_type_enum.dart';

class ExerciseTypeConverter extends TypeConverter<ExerciseType, String> {
  const ExerciseTypeConverter();

  @override
  ExerciseType fromSql(String fromDb) {
    return ExerciseType.values.firstWhere((e) => e.name == fromDb);
  }

  @override
  String toSql(ExerciseType value) {
    return value.name;
  }
}