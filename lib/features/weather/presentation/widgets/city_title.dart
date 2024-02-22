import 'package:flutter/material.dart';
import 'package:space_scutum_test/core/constants/font_sizes.dart';

class CityTitle extends StatelessWidget {
  final String cityName;
  const CityTitle({required this.cityName, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cityName,
          style: const TextStyle(
            fontSize: largeFontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          'Today',
          style: TextStyle(
            fontSize: mediumFontSize,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
