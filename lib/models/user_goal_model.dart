import 'package:json_annotation/json_annotation.dart' as j;

@j.JsonSerializable()
class UserGoalModel {
  int goalStepsCount;
  double goalWeight;
  double goalDistanceCovered;
  double goalCaloriesBurned;

  UserGoalModel({
    required this.goalStepsCount,
    required this.goalWeight,
    required this.goalDistanceCovered,
    required this.goalCaloriesBurned,
  });

  Map<String, dynamic> toJson() => {
    'goalStepsCount': goalStepsCount,
    'goalWeight': goalWeight,
    'goalDistanceCovered': goalDistanceCovered,
    'goalCaloriesBurned': goalCaloriesBurned,
  };

  factory UserGoalModel.fromJson(Map<String, dynamic> json) => UserGoalModel(
    goalStepsCount: json['goalStepsCount'],
    goalWeight: json['goalWeight'],
    goalDistanceCovered: json['goalDistanceCovered'],
    goalCaloriesBurned: json['goalCaloriesBurned'],
  );
}
