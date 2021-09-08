import 'package:flutter/material.dart';
import 'package:weather_app/app/data/models/daily_weather_data.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/helper_functions.dart';

class DailyWeatherContainer extends StatelessWidget {
  const DailyWeatherContainer({
    Key? key,
    required this.dayName,
    required this.weatherStateIcon,
    required this.temp,
    this.imagePath,
    this.onPressed,
    this.isActive = false,
  }) : super(key: key);
  final String dayName;
  final String? imagePath;
  final IconData weatherStateIcon;
  final num temp;
  final VoidCallback? onPressed;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        height: 110,
        width: 65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color:
                    isActive ? primaryColor : primaryColor.withOpacity(0.5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              text(dayName),
              imagePath != null
                  ? Image.network(
                      'http://openweathermap.org/img/wn/' + imagePath! + '.png')
                  : Icon(
                      weatherStateIcon,
                      size: 30,
                    ),
              text('$temp°c')
            ],
          ),
        ),
      ),
    );
  }
}
