import '../../../../../core/params/params.dart';
import '../entities/weather_forecast_entity.dart';

abstract class WeatherRepository {
  Future<WeatherForecastEntity> getWeatherForecast({
    required WeatherForecastParams weatherForecastParams,
  });
}
