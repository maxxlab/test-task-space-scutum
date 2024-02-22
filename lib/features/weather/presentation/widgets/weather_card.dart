import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test/core/constants/spacings.dart';
import 'package:space_scutum_test/features/weather/presentation/providers/weather_forecast_bloc/weather_forecast_bloc.dart';
import 'package:space_scutum_test/features/weather/presentation/widgets/city_title.dart';
import 'package:space_scutum_test/features/weather/presentation/widgets/humidity.dart';
import 'package:space_scutum_test/features/weather/presentation/widgets/temperature.dart';
import 'package:space_scutum_test/features/weather/presentation/widgets/weather_error_card.dart';
import 'package:space_scutum_test/features/weather/presentation/widgets/weather_icon.dart';
import 'package:space_scutum_test/features/weather/presentation/widgets/wind_speed.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
      builder: (context, state) {
        if (state is WeatherForecastLoaded) {
          final data = state.weatherForecastEntity;

          return Container(
            padding: const EdgeInsets.all(horizontalSpacing),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: largeVerticalSpacing,
                  ),
                  Card(
                    elevation: elevation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: largeHorizontalSpacing,
                          vertical: doubleVerticalSpacing),
                      child: Column(
                        children: [
                          CityTitle(cityName: data.cityName),
                          const SizedBox(
                            height: horizontalSpacing,
                          ),
                          Temperature(temp: data.temp),
                          const SizedBox(
                            width: sizedBoxWidth,
                            child: Divider(),
                          ),
                          WeatherIcon(weatherIcon: data.main),
                          WindSpeed(windSpeed: data.windSpeed),
                          Humidity(humidity: data.humidity),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (state is WeatherForecastError) {
          return WeatherErrorCard(error: state.error);
        } else {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(top: doubleVerticalSpacing),
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
