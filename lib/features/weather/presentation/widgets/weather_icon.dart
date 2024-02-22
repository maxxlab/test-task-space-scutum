import 'package:flutter/material.dart';
import 'package:space_scutum_test/assets/weather_icons/weather_icons.dart';
import 'package:space_scutum_test/core/constants/font_sizes.dart';

class WeatherIcon extends StatelessWidget {
  final String weatherIcon;
  const WeatherIcon({required this.weatherIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherIconsSet.weatherIcons.containsKey(weatherIcon)
        ? Icon(
            WeatherIconsSet.weatherIcons[weatherIcon],
            size: largeFontSize,
          )
        : Text(
            weatherIcon,
            style: const TextStyle(
              fontSize: mediumFontSize,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),
          );
  }
}
