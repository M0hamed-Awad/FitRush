import 'package:drift/drift.dart';
import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/database/tables/exercises_table.dart';

part 'exercise_dao.g.dart';

@DriftAccessor(tables: [ExercisesTable])
class ExerciseDao extends DatabaseAccessor<AppDatabase>
    with _$ExerciseDaoMixin {
  ExerciseDao(super.db);

  // Insert a Exercise
  Future<int> insertExercise(ExercisesTableCompanion exercise) =>
      into(exercisesTable).insert(exercise);

  // Get all Exercises
  Future<List<ExercisesTableData>> getAllExercises() =>
      select(exercisesTable).get();

  // Watch Exercises as a Stream
  Stream<List<ExercisesTableData>> watchAllExercises() =>
      select(exercisesTable).watch();
}
