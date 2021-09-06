import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:weather_app/app/modules/home/widgets/daily_weather_container.dart';
import 'package:weather_app/app/modules/home/widgets/weather_text_icon.dart';
import 'package:weather_app/utils/colors.dart';

/// Gauge imports
import 'package:weather_app/utils/contats.dart';
import 'package:weather_app/utils/helper_functions.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(DateFormat('h:mm a').format(DateTime.now()),
            fontWeight: FontWeight.w600),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: AssetImage('$IMAGES_PATH/52.jpeg'),
            ),
          )
        ],
        leading: Icon(FluentIcons.line_horizontal_5_20_regular),
      ),
      body: Container(
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            text(
              'Maiami',
              textStyle: Get.theme.textTheme.headline4!
                  .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
            ),
            SizedBox(height: 15),
            text('Florida, USA    17 JUNE, 21',
                textColor: fontColor, fontWeight: FontWeight.w500),
            SizedBox(height: 25),

            // Cauge
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                    startAngle: 130,
                    endAngle: 50,
                    minimum: -10,
                    maximum: 60,
                    minorTicksPerInterval: 5,
                    showTicks: true,
                    showLabels: true,
                    labelsPosition: ElementsPosition.outside,
                    labelFormat: '{value}°',
                    labelOffset: 15,
                    tickOffset: 15,
                    ticksPosition: ElementsPosition.outside,
                    canRotateLabels: false,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 20,
                      color: shadowColor,
                    ),
                    interval: 10,
                    pointers: const <GaugePointer>[
                      MarkerPointer(
                        value: 50,
                        elevation: 10,
                        markerWidth: 20,
                        markerHeight: 20,
                        color: const Color(0xff4849DB),
                        markerType: MarkerType.circle,
                        animationType: AnimationType.easeInCirc,
                        enableAnimation: true,
                        markerOffset: -5,
                      ),
                      RangePointer(
                        value: 50,
                        width: 7,
                        color: Color(0xff4849DB),
                        animationType: AnimationType.easeInCirc,
                        enableAnimation: true,
                        cornerStyle: CornerStyle.bothCurve,
                      )
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: Container(
                                child: text(
                                  '50° C',
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        angle: 270,
                        positionFactor: 0.1,
                      )
                    ]),
              ],
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherTextIcon(
                    iconText: '10km/h',
                    icon: FluentIcons.weather_squalls_48_regular,
                  ),
                  WeatherTextIcon(
                    iconText: '30%',
                    icon: FluentIcons.drop_48_regular,
                  ),
                  WeatherTextIcon(
                    iconText: '5%',
                    icon: FluentIcons.weather_drizzle_48_regular,
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height / 40),
            Divider(
              endIndent: 16,
              indent: 16,
            ),
            SizedBox(height: Get.height / 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  text('This week', fontSize: 18, fontWeight: FontWeight.w600),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      width: Get.width * 1.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            7,
                            (index) => DailyWeatherContainer(
                              dayName: 'Mon',
                              weatherStateIcon:
                                  FluentIcons.weather_sunny_48_regular,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}