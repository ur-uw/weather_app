import 'package:get/get_connect.dart';
import 'package:weather_app/app/data/weather_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// CONSTANTS
const String API_KEY = "4d3707361dd49879e811b1fd82944f64";
const String BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
const String MODE = "accurate";

class WeatherService {
  /// Call weather api to get a `WeatherModel` as response
  Future<WeatherData?> getCityWeather({
    required String city,
    required double lat,
    required double long,
  }) async {
    try {
      var url = Uri.parse(
        BASE_URL +
            '?q=${city.toLowerCase()}&appid=$API_KEY&mode=$MODE&lat=$lat&lon=$long',
      );
      var res = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      return weatherDataFromJson(res.body);
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }
}
