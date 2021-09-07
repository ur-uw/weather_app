import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/data/address_model.dart';
import 'package:weather_app/app/data/current_weather_model.dart';
import 'package:weather_app/app/data/models/daily_weather_data.dart';
import 'package:weather_app/services/weather_service.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();
  final WeatherService _weatherService = new WeatherService();
  final RxnString currentTime = RxnString();
  final Rxn<Position> _userPosition = Rxn();
  final Rxn<AddressModel> _currentUserAddress = Rxn<AddressModel>();
  final Rxn<CurrentWeatherData> _currentWeather = Rxn<CurrentWeatherData>();
  final Rxn<DailyWeatherData> _dailyWeatherData = Rxn<DailyWeatherData>();

  /// Get current weather data
  CurrentWeatherData? get currentWeather => _currentWeather.value;

  /// Get daily weather data
  DailyWeatherData? get dailyWeather => _dailyWeatherData.value;

  ///Get current user location
  Position? get userPosition => _userPosition.value;

  ///Get current user address
  AddressModel? get currentUserAddress => _currentUserAddress.value;

  ///Get real time
  void _getTime() =>
      currentTime.value = DateFormat('h:mm a').format(DateTime.now());

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  /// Determine the current address of the device.
  Future<Placemark> _detrmineAddress(Position pos) async {
    List<Placemark> placeMarks = await GeocodingPlatform.instance
        .placemarkFromCoordinates(pos.latitude, pos.longitude);
    return placeMarks.first;
  }

  @override
  void onInit() {
    _getTime();
    // Update time every 1 second.
    Timer.periodic(Duration(seconds: 1), (timer) => _getTime());
    super.onInit();
  }

  @override
  void onReady() async {
    try {
      _userPosition.value = await _determinePosition();
      var res = await rootBundle.loadString('assets/models/daily_weather.json');
      _dailyWeatherData.value = dailyWeatherDataFromJson(res);
      if (_userPosition.value != null) {
        final Placemark plcMark = await _detrmineAddress(_userPosition.value!);
        _currentUserAddress.value = new AddressModel(
          countryCode: plcMark.isoCountryCode,
          country: plcMark.country,
          subLocality: plcMark.subLocality,
          city: plcMark.locality,
        );
        // TODO: FIX UNAUTHORIZED WHEN REQUESTING DAILY WEATHER
        // _currentWeather.value = await _weatherService.getCurrentWeather(
        //   city: plcMark.locality!,
        //   lat: _userPosition.value?.latitude ?? 0,
        //   long: _userPosition.value?.longitude ?? 0,
        // );
      }
    } catch (e) {
      printError(info: e.toString());
    }
    super.onReady();
  }
}
