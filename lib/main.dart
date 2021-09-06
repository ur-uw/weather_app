import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/utils/colors.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: secondaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: primaryColor),
          elevation: 0,
          textTheme: TextTheme(headline6: TextStyle(color: primaryColor)),
        ),
        iconTheme: IconThemeData(color: fontColor, size: 25),
      ),
    ),
  );
}
