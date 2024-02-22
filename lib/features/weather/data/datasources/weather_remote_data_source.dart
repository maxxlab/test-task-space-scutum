import 'package:dio/dio.dart';
import 'package:space_scutum_test/core/constants/weather_constants.dart';
import '../../../../../core/params/params.dart';
import '../models/weather_forecast_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherForecastModel> getWeatherForeacast(
      {required WeatherForecastParams weatherForeacastParams});
}

class WeatheRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;

  WeatheRemoteDataSourceImpl({required this.dio});

  @override
  Future<WeatherForecastModel> getWeatherForeacast(
      {required WeatherForecastParams weatherForeacastParams}) async {
    final response = await dio.get(
      WeatherConstants.cityForecast(weatherForeacastParams.cityName),
    );

    return WeatherForecastModel.fromJsonNetwork(response.data);
  }
}
