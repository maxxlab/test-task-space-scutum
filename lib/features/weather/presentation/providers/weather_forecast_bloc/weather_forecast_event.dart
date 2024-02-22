part of 'weather_forecast_bloc.dart';

sealed class WeatherForecastEvent extends Equatable {
  const WeatherForecastEvent();

  @override
  List<Object> get props => [];
}

class LoadWeatherForecast extends WeatherForecastEvent {}

class SearchWeatherForecast extends WeatherForecastEvent {
  final String cityName;

  const SearchWeatherForecast({
    required this.cityName,
  });

  @override
  List<Object> get props => [cityName];
}
