import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/helper_functions.dart';

class DailyWeatherContainer extends StatelessWidget {
  const DailyWeatherContainer(
      {Key? key, required this.dayName, required this.weatherStateIcon})
      : super(key: key);
  final String dayName;
  final IconData weatherStateIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor.withOpacity(0.5))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text(dayName),
            Icon(
              weatherStateIcon,
              size: 30,
            ),
            text('32°c')
          ],
        ),
      ),
    );
  }
}
