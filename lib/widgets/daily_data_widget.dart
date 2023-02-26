import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/utils/custom_colors.dart';

class DailyDataForeCast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForeCast({super.key, required this.weatherDataDaily});

  // Process the date and time
  String getDay(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String res = DateFormat('EEE').format(date);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: CustomColors.dividerLine.withAlpha(150),
          borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(bottom: 10),
          child: const Text(
            "Next Days",
            style: TextStyle(
                color: CustomColors.textColorBlack,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
        dailyList(),
      ]),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 80,
                          child: Text(
                            getDay(weatherDataDaily.daily[index].dt),
                            style: const TextStyle(
                                color: CustomColors.textColorBlack,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "${weatherDataDaily.daily[index].temp!.max!.toInt()}°/${weatherDataDaily.daily[index].temp!.min!.toInt()}°",
                      )
                    ],
                  )),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              )
            ],
          );
        },
      ),
    );
  }
}
