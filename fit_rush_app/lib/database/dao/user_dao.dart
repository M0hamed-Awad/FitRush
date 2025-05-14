import 'package:drift/drift.dart';
import 'package:fit_rush_app/database/app_database.dart';
import 'package:fit_rush_app/database/tables/users_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UsersTable])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  // Insert a user
  Future<int> insertUser(UsersTableCompanion user) =>
      into(usersTable).insertOnConflictUpdate(user);

  // Get all users
  Future<List<UsersTableData>> getAllUsers() => select(usersTable).get();

  // Watch users as a stream (useful for UI)
  Stream<List<UsersTableData>> watchAllUsers() => select(usersTable).watch();

  // Get a user by ID
  Future<UsersTableData?> getUserById(int id) {
    return (select(usersTable)
      ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  // Delete a user
  Future<int> deleteUser(int id) {
    return (delete(usersTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}
