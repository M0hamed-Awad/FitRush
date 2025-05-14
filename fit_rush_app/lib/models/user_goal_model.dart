import 'package:json_annotation/json_annotation.dart' as j;

@j.JsonSerializable()
class UserGoalModel {
  int walkedSteps;
  double weight;
  double distanceCovered;
  double caloriesBurned;

  UserGoalModel({
    required this.walkedSteps,
    required this.weight,
    required this.distanceCovered,
    required this.caloriesBurned,
  });

  Map<String, dynamic> toJson() => {
    'walkedSteps': walkedSteps,
    'weight': weight,
    'distanceCovered': distanceCovered,
    'caloriesBurned': caloriesBurned,
  };

  factory UserGoalModel.fromJson(Map<String, dynamic> json) => UserGoalModel(
    walkedSteps: json['walkedSteps'],
    weight: json['weight'],
    distanceCovered: json['distanceCovered'],
    caloriesBurned: json['caloriesBurned'],
  );
}
