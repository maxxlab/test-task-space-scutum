import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test/core/constants/spacings.dart';
import 'package:space_scutum_test/features/weather/presentation/providers/weather_forecast_bloc/weather_forecast_bloc.dart';

class SearchCityBar extends StatefulWidget {
  const SearchCityBar({super.key});

  @override
  State<SearchCityBar> createState() => _SearchCityBarState();
}

class _SearchCityBarState extends State<SearchCityBar> {
  final _formKey = GlobalKey<FormState>();
  final cityNameController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final cityName = cityNameController.text;

      cityNameController.clear();

      BlocProvider.of<WeatherForecastBloc>(context).add(
        SearchWeatherForecast(cityName: cityName),
      );
    }
  }

  @override
  void dispose() {
    cityNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: cityNameController,
              validator: (value) => value!.isEmpty
                  ? 'You have to enter the name of the city'
                  : null,
              decoration: const InputDecoration(
                hintText: 'City',
                labelText: 'City',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),
          const SizedBox(
            width: horizontalSpacing,
          ),
          ElevatedButton(
            onPressed: () {
              _submitForm();
            },
            child: const Text('Search'),
          )
        ],
      ),
    );
  }
}
