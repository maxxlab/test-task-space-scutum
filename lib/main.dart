import 'package:flutter/material.dart';
import 'package:space_scutum_test/features/bottom_navigation/presentation/bottom_navigation_bar.dart';
import 'package:space_scutum_test/features/task_list/presentation/providers/category_bloc/category_bloc.dart';
import 'package:space_scutum_test/features/task_list/presentation/providers/task_list_bloc/task_list_bloc.dart';
import 'package:space_scutum_test/features/weather/presentation/providers/weather_forecast_bloc/weather_forecast_bloc.dart';
import 'package:space_scutum_test/theme/color_schemes.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TaskListBloc>(
          create: (context) => TaskListBloc()..add(LoadTasks()),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider<WeatherForecastBloc>(
          create: (context) => WeatherForecastBloc()
            ..add(const SearchWeatherForecast(cityName: 'New York')),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Task',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      home: const BottomNavBar(),
    );
  }
}
