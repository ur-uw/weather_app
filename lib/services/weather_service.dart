import 'package:weather_app/app/data/models/current_weather_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/app/data/models/daily_weather_data.dart';
import 'package:weather_app/app/data/models/weather_data.dart';

// CONSTANTS
const String API_KEY = "4d3707361dd49879e811b1fd82944f64";
const String CURRENT_WEATHER_BASE_URL =
    "https://api.openweathermap.org/data/2.5/weather";

const String DAILY_WEATHER_BASE_URL =
    "https://api.openweathermap.org/data/2.5/forecast/daily";

const String ONECALL_WEATHER_BASE_URL =
    "https://api.openweathermap.org/data/2.5/onecall";

class WeatherService {
  /// Call weather api to get a `CurrentWeatherData` as response
  Future<CurrentWeatherData?> getCurrentWeather({
    required String city,
    required double lat,
    required double long,
  }) async {
    try {
      var url = Uri.parse(
        CURRENT_WEATHER_BASE_URL +
            '?q=${city.toLowerCase()}&appid=$API_KEY&lat=$lat&lon=$long',
      );
      var res = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      return currentWeatherDataFromJson(res.body);
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }

  /// Call weather api to get a `DailyWeatherData` as response
  Future<DailyWeatherData?> getDailyWeather({
    required String city,
    required double lat,
    required double long,
  }) async {
    try {
      var url = Uri.parse(
        DAILY_WEATHER_BASE_URL +
            '?q=${city.toLowerCase()}&appid=$API_KEY&lat=$lat&lon=$long&units=metric',
      );
      var res = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      return dailyWeatherDataFromJson(res.body);
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }

  /// Make one API call and get current, forecast and historical weather data
  /// Minute forecast for 1 hour
  /// Hourly forecast for 48 hours
  /// Daily forecast for 7 days
  /// Historical data for 5 previous days
  /// National weather alerts
  /// JSON format
  /// Included in both free and paid subscriptions
  Future<WeatherData?> getWeatherData({
    required double lat,
    required double long,
  }) async {
    try {
      var url = Uri.parse(
        ONECALL_WEATHER_BASE_URL +
            '?appid=$API_KEY&lat=$lat&lon=$long&units=metric',
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
