import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/ger_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
// ignore: unused_import
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const CustomMateroalApp(),
    );
  }
}

class CustomMateroalApp extends StatelessWidget {
  const CustomMateroalApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: getThemeColor(
              BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.weatherCondition,
            ),
          ),
          home: const HomeView(),
        );
      },
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  List<String> sunnyConditions = [
    'Sunny',
    'Patchy light drizzle',
    'Patchy light rain',
    'Patchy light rain with thunder',
  ];
  List<String> rainyConditions = [
    'Light rain shower',
    'Moderate rain at times',
    'Moderate rain',
    'Heavy rain at times',
    'Heavy rain',
    'Light freezing rain',
    'Moderate or heavy freezing rain',
    'Patchy light rain',
  ];
  List<String> cloudyConditions = [
    'Partly cloudy',
    'Overcast',
    'Cloudy',
    'Mist',
    'Fog',
    'Freezing fog',
  ];
  List<String> snowyConditions = [
    'Patchy snow possible',
    'Patchy sleet possible',
    'Patchy freezing drizzle possible',
    'Blowing snow',
    'Blizzard',
    'Light sleet',
    'Moderate or heavy sleet',
    'Patchy light snow',
    'Light snow',
    'Patchy moderate snow',
    'Moderate snow',
    'Patchy heavy snow',
    'Heavy snow',
    'Ice pellets',
    'Light sleet showers',
    'Moderate or heavy sleet showers',
    'Light snow showers',
    'Moderate or heavy snow showers',
    'Light showers of ice pellets',
    'Moderate or heavy showers of ice pellets',
    'Patchy light snow with thunder',
    'Moderate or heavy snow with thunder',
  ];
  List<String> thunderstormConditions = [
    'Thundery outbreaks possible',
    'Patchy light rain with thunder',
    'Moderate or heavy rain with thunder',
    'Patchy light snow with thunder',
  ];

  if (sunnyConditions.contains(condition)) {
    return Colors.orange;
  } else if (rainyConditions.contains(condition)) {
    return Colors.lightBlue;
  } else if (cloudyConditions.contains(condition)) {
    return Colors.blueGrey;
  } else if (snowyConditions.contains(condition)) {
    return Colors.blueGrey;
  } else if (thunderstormConditions.contains(condition)) {
    return Colors.deepPurple;
  } else {
    return Colors.grey;
  }
}
