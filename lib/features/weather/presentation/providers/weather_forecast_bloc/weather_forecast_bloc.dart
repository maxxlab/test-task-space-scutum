import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_scutum_test/core/connection/network_info.dart';
import 'package:space_scutum_test/core/params/params.dart';
import 'package:space_scutum_test/features/weather/business/entities/weather_forecast_entity.dart';
import 'package:space_scutum_test/features/weather/business/usecases/get_weather_forecast.dart';
import 'package:space_scutum_test/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:space_scutum_test/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:space_scutum_test/features/weather/data/repositories/weather_repository_impl.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  WeatherForecastBloc() : super(WeatherForecastInitial()) {
    on<SearchWeatherForecast>(
      (event, emit) async {
        try {
          final loadedWeatherForecast = await GetWeatherForecast(
            weatherForecastRepository: WeatherRepositoryImpl(
              localDataSource: WeatherLocalDataSourceImpl(
                sharedPreferences: await SharedPreferences.getInstance(),
              ),
              networkInfo: NetworkInfoImpl(DataConnectionChecker()),
              remoteDataSource: WeatheRemoteDataSourceImpl(
                dio: Dio(),
              ),
            ),
          ).call(
            weatherForecastParams:
                WeatherForecastParams(cityName: event.cityName),
          );

          emit(WeatherForecastLoaded(
              weatherForecastEntity: loadedWeatherForecast));
        } on DioException catch (e) {
          emit(
            const WeatherForecastError(
                error: 'Oops, It seems that such a city does not exist'),
          );
        } catch (error) {
          emit(
            WeatherForecastError(
              error: error.toString(),
            ),
          );
        }
      },
    );
  }
}
