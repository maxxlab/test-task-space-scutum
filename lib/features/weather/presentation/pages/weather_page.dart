import 'package:flutter/material.dart';
import 'package:space_scutum_test/core/constants/spacings.dart';
import 'package:space_scutum_test/features/weather/presentation/widgets/search_bar.dart';
import 'package:space_scutum_test/features/weather/presentation/widgets/weather_card.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: doubleVerticalSpacing,
            ),
            SearchCityBar(),
            WeatherCard(),
          ],
        ),
      ),
    );
  }
}
