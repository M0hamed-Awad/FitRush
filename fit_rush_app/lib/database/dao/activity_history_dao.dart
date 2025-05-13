import 'package:drift/drift.dart';
import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/database/tables/activity_history_table.dart';

part 'activity_history_dao.g.dart';

@DriftAccessor(tables: [ActivityHistoryTable])
class ActivityHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$ActivityHistoryDaoMixin {
  ActivityHistoryDao(super.db);

  // Insert a new activity record
  Future<int> insertActivity(ActivityHistoryTableCompanion activity) =>
      into(activityHistoryTable).insert(activity);

  // Get all activity records
  Future<List<ActivityHistoryTableData>> getAllActivities() =>
      select(activityHistoryTable).get();

  // Watch all activity records as a stream (for UI updates)
  Stream<List<ActivityHistoryTableData>> watchAllActivities() =>
      select(activityHistoryTable).watch();

  // Get activities by user ID
  Future<List<ActivityHistoryTableData>> getActivitiesByUserId(int userId) {
    return (select(activityHistoryTable)
      ..where((tbl) => tbl.userId.equals(userId))).get();
  }

  // Delete all activities of a user
  Future<int> deleteActivitiesByUserId(int userId) {
    return (delete(activityHistoryTable)
      ..where((tbl) => tbl.userId.equals(userId))).go();
  }
}

// expand this with filters like by date range, by type (manual/automatic),
// or ordering (latest first), depending on app needs.
