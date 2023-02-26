import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/utils/custom_colors.dart';
import 'package:weather_app/widgets/comfort_level_widget.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/widgets/hourly_data_widget.dart';

import '../widgets/daily_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call for global controller

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(() => globalController.checkLoading().isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const HeaderWidget(),
                const SizedBox(
                  height: 10,
                ),
                //Current Temp
                CurrentWeatherWidget(
                  weatherDataCurrent:
                      globalController.getWeatherData().getWeatherDataCurrent(),
                ),
                const SizedBox(
                  height: 10,
                ),
                HourlyDataWidget(
                    weatherDataHourly: globalController
                        .getWeatherData()
                        .getWeatherDataHourly()),
                const SizedBox(
                  height: 10,
                ),
                DailyDataForeCast(
                  weatherDataDaily:
                      globalController.getWeatherData().getWeatherDataDaily(),
                ),
                Container(
                  height: 1,
                  color: CustomColors.dividerLine,
                ),
                const SizedBox(
                  height: 10,
                ),
                ComfortLevelWidget(
                    weatherDataCurrent: globalController
                        .getWeatherData()
                        .getWeatherDataCurrent())
              ],
            ))),
    ));
  }
}
