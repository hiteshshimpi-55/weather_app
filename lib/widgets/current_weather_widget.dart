import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Temperature Area
        temperatureAreaWidget(),
        const SizedBox(
          height: 20,
        ),
        // Description Area
        currentWeatherDetailsWidget(),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "${weatherDataCurrent.current.temp!.toInt()}°",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 60,
                  color: CustomColors.textColorBlack)),
          TextSpan(
              text: "${weatherDataCurrent.current.weather![0].description}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: CustomColors.textColorBlack))
        ]))
      ],
    );
  }

  Widget currentWeatherDetailsWidget() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomColors.cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset("assets/icons/windspeed.png"),
          ),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomColors.cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset("assets/icons/humidity.png"),
          ),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomColors.cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset("assets/icons/clouds.png"),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataCurrent.current.windSpeed} km/hr",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataCurrent.current.humidity}%",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataCurrent.current.clouds}%",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      )
    ]);
  }
}
