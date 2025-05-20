class BmiModel {
  final double bmi;
  final String weightStatus;

  BmiModel({required this.bmi, required this.weightStatus});

  factory BmiModel.fromJson(Map<String, dynamic> json) {
    return BmiModel(
      bmi: double.parse((json['bmi'] as num).toStringAsFixed(1)),
      weightStatus:
          json['bmiCategoryForAdults']['category']?.toString() ?? 'Unknown',
    );
  }
}