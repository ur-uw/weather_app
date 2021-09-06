import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/helper_functions.dart';

class WeatherTextIcon extends StatelessWidget {
  final String iconText;
  final IconData icon;
  const WeatherTextIcon({
    Key? key,
    required String this.iconText,
    required IconData this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              color: shadowColor, borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 10),
        text(
          iconText,
          fontSize: 11,
        )
      ],
    );
  }
}
