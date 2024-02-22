import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/weather_forecast_model.dart';

abstract class WeatherLocalDataSource {
  Future<void> cacheWeatherForecast(
      {required WeatherForecastModel? weatherForecastToCache});
  Future<WeatherForecastModel> getLastWeatherForecast();
}

const cachedWeatherForecast = 'CACHED_WEATHER_FORECAST';

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherForecastModel> getLastWeatherForecast() {
    final jsonString = sharedPreferences.getString(cachedWeatherForecast);

    if (jsonString != null) {
      return Future.value(
          WeatherForecastModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheWeatherForecast(
      {required WeatherForecastModel? weatherForecastToCache}) async {
    if (weatherForecastToCache != null) {
      sharedPreferences.setString(
        cachedWeatherForecast,
        json.encode(
          weatherForecastToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
