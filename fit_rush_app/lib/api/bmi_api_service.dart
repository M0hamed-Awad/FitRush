import 'package:fit_rush_app/helper/api_helper.dart';
import 'package:fit_rush_app/models/bmi_model.dart';

class BmiService {
  final ApiHelper _apiHelper = ApiHelper();

  final String _url =
      "https://smart-body-mass-index-calculator-bmi.p.rapidapi.com/api/BMI/metric";
  final String _apiKey = "4bdfcde639msh1fbe53d87f6836fp177464jsncfa76169b799";
  final String _apiHost = "smart-body-mass-index-calculator-bmi.p.rapidapi.com";

  Future<BmiModel> getBmi({required int weight, required int height}) async {
    final Map<String, dynamic> queryParams = {"kg": weight, "cm": height};

    final Map<String, dynamic> headers = {
      "x-rapidapi-key": _apiKey,
      "x-rapidapi-host": _apiHost,
    };

    final response = await _apiHelper.get(
      url: _url,
      queryParams: queryParams,
      headers: headers,
    );

    return BmiModel.fromJson(response);
  }
}
