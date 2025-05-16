import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fit_rush_app/database/converters/exercise_type_converter.dart';
import 'package:fit_rush_app/database/converters/user_goal_type_converter.dart';
import 'package:fit_rush_app/models/exercise_type_enum.dart';
import 'package:fit_rush_app/models/user_goal_model.dart';
import 'package:path_provider/path_provider.dart';
// Tables
import 'package:fit_rush_app/database/tables/activity_history_table.dart';
import 'package:fit_rush_app/database/tables/exercises_table.dart';
import 'package:fit_rush_app/database/tables/users_table.dart';
// DAOs
import 'package:fit_rush_app/database/dao/activity_history_dao.dart';
import 'package:fit_rush_app/database/dao/exercise_dao.dart';
import 'package:fit_rush_app/database/dao/user_dao.dart';

part 'app_database.g.dart';
// flutter pub run build_runner build

@DriftDatabase(
  tables: [UsersTable, ExercisesTable, ActivityHistoryTable],
  daos: [UserDao, ExerciseDao, ActivityHistoryDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase._internal() : super(_openConnection());
  static final AppDatabase _instance = AppDatabase._internal();
  static AppDatabase get instance => _instance;

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/fit_rush_database.sqlite');
    return NativeDatabase.createInBackground(file);
  });
}
