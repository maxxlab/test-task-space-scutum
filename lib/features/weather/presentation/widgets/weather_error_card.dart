import 'package:flutter/material.dart';
import 'package:space_scutum_test/core/constants/spacings.dart';

class WeatherErrorCard extends StatelessWidget {
  final String error;
  const WeatherErrorCard({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: doubleVerticalSpacing,
          ),
          Card(
            elevation: elevation,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: largeHorizontalSpacing,
                  vertical: doubleVerticalSpacing),
              child: Text(error),
            ),
          )
        ],
      ),
    );
  }
}
