import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Text text(
  String text, {
  Color? textColor,
  FontWeight? fontWeight,
  double? fontSize,
  String? fontFamily,
  FontStyle? fontStyle,
  double? letterSpacing,
  TextDirection? textDirection,
  TextAlign? textAlign,
  TextStyle? textStyle,
  int? maxLines,
  double? wordSpacing,
  double? lineHeight,
}) {
  return Text(
    text.tr,
    textDirection: textDirection,
    textAlign: textAlign,
    maxLines: maxLines,
    style: textStyle ??
        TextStyle(
          wordSpacing: wordSpacing,
          color: textColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          height: lineHeight,
        ),
  );
}

/// Get week day name
/// WeekDayNumber starts with monday
String getWeekDayName(int weekDayNumber) {
  switch (weekDayNumber) {
    case 1:
      return 'Mon';
    case 2:
      return 'Tus';
    case 3:
      return 'Wed';
    case 4:
      return 'Thu';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
    case 7:
      return 'Sun';
    default:
      return 'Mon';
  }
}

/// Get weather fluent icon based on api icon code.
IconData getWeatherIcon(String iconCode) {
  switch (iconCode) {
    case '01d':
      return FluentIcons.weather_sunny_48_regular;
    case '02d':
      return FluentIcons.weather_partly_cloudy_day_48_regular;
    case '03d':
      return FluentIcons.cloud_48_regular;
    case '04d':
      return FluentIcons.weather_cloudy_48_regular;
    case '09d':
      return FluentIcons.weather_rain_48_regular;
    case '10d':
      return FluentIcons.weather_rain_showers_day_48_regular;
    case '11d':
      return FluentIcons.weather_thunderstorm_48_regular;
    case '13d':
      return FluentIcons.weather_snowflake_48_regular;
    case '50d':
      return FluentIcons.weather_fog_48_regular;
    default:
      return FluentIcons.weather_sunny_48_regular;
  }
}
