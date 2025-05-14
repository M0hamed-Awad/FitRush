import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fit_rush_app/models/user_goal_model.dart';

class UserGoalTypeConverter extends TypeConverter<UserGoalModel, String>
    with JsonTypeConverter2<UserGoalModel, String, Map<String, Object?>> {
  const UserGoalTypeConverter();

  @override
  UserGoalModel fromSql(String fromDb) {
    return fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(UserGoalModel value) {
    return json.encode(toJson(value));
  }

  @override
  UserGoalModel fromJson(Map<String, Object?> json) {
    return UserGoalModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson(UserGoalModel value) {
    return value.toJson();
  }
}
