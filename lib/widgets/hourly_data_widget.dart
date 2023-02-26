import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/model/weather_data_hourly.dart';
import 'package:weather_app/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({super.key, required this.weatherDataHourly});

  // Card Index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            alignment: Alignment.topCenter,
            child: const Text(
              "Today",
              style: TextStyle(fontSize: 18),
            )),
        hourlyListWidget(),
      ],
    );
  }

  Widget hourlyListWidget() {
    return Container(
        height: 160,
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherDataHourly.hourly.length > 9
              ? 9
              : weatherDataHourly.hourly.length,
          itemBuilder: (context, index) {
            return Obx(() => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.dividerLine.withAlpha(150),
                        spreadRadius: 1,
                        blurRadius: 30,
                        offset:
                            const Offset(0.5, 0), // changes position of shadow
                      ),
                    ],
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            Color.fromARGB(255, 42, 114, 195),
                            Color.fromARGB(255, 108, 161, 233)
                          ])
                        : null,
                  ),
                  child: HourlyDetail(
                    temp: weatherDataHourly.hourly[index].temp!,
                    day: weatherDataHourly.hourly[index].dt!,
                    weatherIcon:
                        weatherDataHourly.hourly[index].weather![0].icon!,
                    index: index,
                    cardIndex: cardIndex.toInt(),
                  ),
                )));
          },
        ));
  }
}

class HourlyDetail extends StatelessWidget {
  int temp;
  int day;
  int index;
  int cardIndex;
  String weatherIcon;

  String getTime(final timeStamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String res = DateFormat('jm').format(date);
    return res;
  }

  HourlyDetail(
      {super.key,
      required this.temp,
      required this.index,
      required this.weatherIcon,
      required this.day,
      required this.cardIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Text(
            getTime(day),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Image.asset('assets/weather/$weatherIcon.png',
              height: 40, width: 40),
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text("$temp°",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: cardIndex == index
                        ? Colors.white
                        : CustomColors.textColorBlack))),
      ],
    );
  }
}
