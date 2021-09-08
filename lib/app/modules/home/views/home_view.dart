import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:weather_app/app/modules/home/widgets/daily_weather_container.dart';
import 'package:weather_app/app/modules/home/widgets/user_address.dart';
import 'package:weather_app/app/modules/home/widgets/weather_text_icon.dart';
import 'package:weather_app/utils/colors.dart';

/// Gauge imports
import 'package:weather_app/utils/contats.dart';
import 'package:weather_app/utils/helper_functions.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            title: text(
              controller.currentTime.value ?? '',
              fontWeight: FontWeight.w600,
            ),
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
          body: controller.weatherData != null
              ? Container(
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          controller.currentUserAddress != null
                              ? UserAddress(
                                  addressModel: controller.currentUserAddress!,
                                )
                              : Container(),
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
                                  pointers: <GaugePointer>[
                                    MarkerPointer(
                                      value: controller.selectedWeekDayWeather
                                              ?.temp?.day ??
                                          controller
                                              .weatherData?.current?.temp ??
                                          0,
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
                                      value: controller.selectedWeekDayWeather
                                              ?.temp?.day ??
                                          controller
                                              .weatherData?.current?.temp ??
                                          0,
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
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 2, 0, 0),
                                            child: Container(
                                              child: text(
                                                '${controller.selectedWeekDayWeather?.temp?.day?.round() ?? controller.weatherData?.current?.temp?.round() ?? 0}° C',
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
                            padding:
                                EdgeInsets.symmetric(horizontal: Get.width / 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WeatherTextIcon(
                                  iconText:
                                      '${controller.selectedWeekDayWeather?.windSpeed ?? controller.weatherData?.current?.windSpeed ?? 0}km/h',
                                  icon: FluentIcons.weather_squalls_48_regular,
                                ),
                                WeatherTextIcon(
                                  iconText:
                                      '${controller.selectedWeekDayWeather?.humidity ?? controller.weatherData?.current?.humidity ?? 0}%',
                                  icon: FluentIcons.drop_48_regular,
                                ),
                                WeatherTextIcon(
                                  iconText:
                                      '${controller.selectedWeekDayWeather?.rain?.round() ?? controller.weatherData?.current?.rain?.round() ?? 0}%',
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                text('This week',
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  child: Container(
                                    width: Get.width * 1.5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ...List.generate(
                                          controller
                                                  .weatherData?.daily?.length ??
                                              0,
                                          (index) {
                                            return DailyWeatherContainer(
                                              dayName: getWeekDayName(
                                                (DateTime.now().weekday +
                                                        index) %
                                                    7,
                                              ),
                                              weatherStateIcon: getWeatherIcon(
                                                controller
                                                        .weatherData
                                                        ?.daily?[index]
                                                        ?.weather
                                                        ?.first
                                                        ?.icon ??
                                                    '',
                                              ),
                                              temp: controller.weatherData
                                                      ?.daily?[index]?.temp?.day
                                                      ?.round() ??
                                                  0,
                                              onPressed: () => controller
                                                      .selectedWeekDayWeather =
                                                  controller.weatherData
                                                      ?.daily?[index],
                                              isActive: index == 0
                                                  ? true
                                                  : controller
                                                          .selectedWeekDayWeather ==
                                                      controller.weatherData
                                                          ?.daily?[index],
                                            );
                                          },
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
                )
              : Center(child: CircularProgressIndicator(color: secondaryColor)),
        );
      },
    );
  }
}
