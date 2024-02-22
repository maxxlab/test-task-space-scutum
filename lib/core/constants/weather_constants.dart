class WeatherConstants {
  static const String weatherApiKey = '6b373b752cfaaa0a9ad9892ec67cebf8';

  static String cityForecast(String cityName) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$weatherApiKey';
}
