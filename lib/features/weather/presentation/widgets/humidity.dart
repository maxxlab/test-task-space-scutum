import 'package:flutter/material.dart';
import 'package:space_scutum_test/assets/weather_icons/weather_icons.dart';
import 'package:space_scutum_test/core/constants/font_sizes.dart';
import 'package:space_scutum_test/core/constants/spacings.dart';
import 'package:space_scutum_test/core/constants/string_constants.dart';

class Humidity extends StatelessWidget {
  final int humidity;
  const Humidity({required this.humidity, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Icon(
            WeatherIconsSet.weatherIcons[kHumidity],
            size: largeFontSize,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(
          width: horizontalSpacing,
        ),
        Container(
          margin: const EdgeInsets.only(top: horizontalSpacing),
          child: Text(
            '$humidity',
            style: const TextStyle(
              fontSize: mediumFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
