import 'package:space_scutum_test/features/weather/business/entities/weather_forecast_entity.dart';
import 'package:space_scutum_test/features/weather/business/repositories/weather_repository.dart';
import 'package:space_scutum_test/features/weather/data/models/weather_forecast_model.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import '../datasources/weather_local_data_source.dart';
import '../datasources/weather_remote_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<WeatherForecastEntity> getWeatherForecast(
      {required WeatherForecastParams weatherForecastParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        WeatherForecastModel weatherForecastRemote = await remoteDataSource
            .getWeatherForeacast(weatherForeacastParams: weatherForecastParams);

        localDataSource.cacheWeatherForecast(
            weatherForecastToCache: weatherForecastRemote);

        return weatherForecastRemote;
      } on ServerException {
        throw ServerException();
      }
    } else {
      try {
        WeatherForecastModel localWeatherForecast =
            await localDataSource.getLastWeatherForecast();
        return localWeatherForecast;
      } on CacheException {
        throw CacheException();
      }
    }
  }
}
