class WeatherForecastEntity {
  final String id;
  final String cityName;
  final String main;
  final String description;
  final double temp;
  final int humidity;
  final double windSpeed;

  WeatherForecastEntity({
    required this.id,
    required this.cityName,
    required this.main,
    required this.description,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
  });
}
