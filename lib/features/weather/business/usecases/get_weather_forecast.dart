import 'package:space_scutum_test/features/weather/business/repositories/weather_repository.dart';
import '../../../../../core/params/params.dart';
import '../entities/weather_forecast_entity.dart';

class GetWeatherForecast {
  final WeatherRepository weatherForecastRepository;

  GetWeatherForecast({required this.weatherForecastRepository});

  Future<WeatherForecastEntity> call({
    required WeatherForecastParams weatherForecastParams,
  }) async {
    return await weatherForecastRepository.getWeatherForecast(weatherForecastParams: weatherForecastParams);
  }
}
