// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:space_scutum_test/core/constants/string_constants.dart';

import '../../business/entities/weather_forecast_entity.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  final String id;
  final String cityName;
  final String main;
  final String description;
  final double temp;
  final int humidity;
  final double windSpeed;

  WeatherForecastModel({
    required this.id,
    required this.cityName,
    required this.main,
    required this.description,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
  }) : super(
          id: '',
          cityName: '',
          main: '',
          description: '',
          temp: 0,
          humidity: 0,
          windSpeed: 0,
        );

  WeatherForecastModel copyWith({
    String? id,
    String? cityName,
    String? main,
    String? description,
    double? temp,
    int? humidity,
    double? windSpeed,
  }) {
    return WeatherForecastModel(
      id: id ?? this.id,
      cityName: cityName ?? this.cityName,
      main: main ?? this.main,
      description: description ?? this.description,
      temp: temp ?? this.temp,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cityName': cityName,
      'main': main,
      'description': description,
      'temp': temp,
      'humidity': humidity,
      'windSpeed': windSpeed,
    };
  }

  factory WeatherForecastModel.fromMap(Map<String, dynamic> map) {
    return WeatherForecastModel(
      id: map['id'] as String,
      cityName: map['cityName'] as String,
      main: map['main'] as String,
      description: map['description'] as String,
      temp: map['temp'] as double,
      humidity: map['humidity'] as int,
      windSpeed: map['windSpeed'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherForecastModel.fromJson(String source) =>
      WeatherForecastModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory WeatherForecastModel.fromJsonNetwork(Map<String, dynamic> json) {
    final weatherData = json[kWeather][0];

    return WeatherForecastModel(
      id: kId,
      cityName: json[kName],
      main: weatherData[kMain],
      description: weatherData[kDescription],
      temp: json[kMain][kTemp].toDouble(),
      humidity: json[kMain][kHumidity].toInt(),
      windSpeed: json[kWind][kSpeed].toDouble(),
    );
  }

  @override
  String toString() {
    return 'WeatherForecastModel(id: $id, cityName: $cityName, main: $main, description: $description, temp: $temp, humidity: $humidity, windSpeed: $windSpeed)';
  }

  @override
  bool operator ==(covariant WeatherForecastModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.cityName == cityName &&
        other.main == main &&
        other.description == description &&
        other.temp == temp &&
        other.humidity == humidity &&
        other.windSpeed == windSpeed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cityName.hashCode ^
        main.hashCode ^
        description.hashCode ^
        temp.hashCode ^
        humidity.hashCode ^
        windSpeed.hashCode;
  }
}
