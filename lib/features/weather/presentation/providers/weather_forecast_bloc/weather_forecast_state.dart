part of 'weather_forecast_bloc.dart';

sealed class WeatherForecastState extends Equatable {
  const WeatherForecastState();

  @override
  List<Object> get props => [];
}

final class WeatherForecastInitial extends WeatherForecastState {
}

final class WeatherForecastLoaded extends WeatherForecastState {
  final WeatherForecastEntity weatherForecastEntity;

  const WeatherForecastLoaded({required this.weatherForecastEntity});

  @override
  List<Object> get props => [weatherForecastEntity];
}

class WeatherForecastError extends WeatherForecastState {
  final String error;

  const WeatherForecastError({required this.error});

  @override
  List<Object> get props => [error];
}
