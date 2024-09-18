// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_meteo/open_meteo.dart';

const double londonLatitude = 51.50853;
const double londonLongitude = -0.12574;
const String defaultTempUnit = '°C';

// in hours
const weatherRefetchTime = 12;

const weather = WeatherApi();

class Temperature {
  String unit;
  double temp;

  Temperature(this.temp, this.unit);

  @override
  String toString() {
    return '${temp.toStringAsFixed(1)} $unit';
  }
}

class DailyWeather {
  DateTime date;
  Temperature maxTemp;
  Temperature minTemp;

  DailyWeather(
      {required this.date, required this.maxTemp, required this.minTemp});
}

class WeatherState {
  Temperature? currentTemp;
  List<DailyWeather>? dailyWeathers;

  DateTime? lastFetched;

  bool get needRefetch =>
      lastFetched != null &&
      DateTime.now()
          .isAfter(lastFetched!.add(const Duration(hours: weatherRefetchTime)));

  WeatherState(
      {this.currentTemp, this.dailyWeathers = const [], this.lastFetched});

  WeatherState copyWith(
      {Temperature? currentTemp,
      List<DailyWeather>? dailyWeathers,
      DateTime? lastFetched}) {
    return WeatherState(
        currentTemp: currentTemp ?? this.currentTemp,
        dailyWeathers: dailyWeathers ?? this.dailyWeathers,
        lastFetched: lastFetched ?? this.lastFetched);
  }
}

class WeatherStateNotifier extends Notifier<WeatherState> {
  @override
  WeatherState build() => WeatherState();

  Future<void> getWeather() async {
    try {
      final response = await weather.request(
        latitude: londonLatitude,
        longitude: londonLongitude,
        current: {WeatherCurrent.temperature_2m},
        daily: {
          WeatherDaily.temperature_2m_max,
          WeatherDaily.temperature_2m_min,
          WeatherDaily.precipitation_probability_max
        },
      );
      final ParameterValue? currentTempData =
          response.currentData[WeatherCurrent.temperature_2m];
      final String tempUnit = currentTempData?.unit ?? defaultTempUnit;
      final double? currentTemp = currentTempData?.value;
      final dailyMaxData =
          response.dailyData[WeatherDaily.temperature_2m_max]?.values;
      final dailyMinData =
          response.dailyData[WeatherDaily.temperature_2m_min]?.values;

      List<DailyWeather> dailyWeathers = [];

      if (dailyMaxData != null && dailyMinData != null) {
        dailyMaxData.forEach((key, value) {
          double min = dailyMinData[key]?.toDouble() ?? 0;
          double max = value.toDouble();
          dailyWeathers.add(DailyWeather(
              date: key,
              minTemp: Temperature(min, tempUnit),
              maxTemp: Temperature(max, tempUnit)));
        });
      }
      state = state.copyWith(
          currentTemp: Temperature(currentTemp!, tempUnit),
          dailyWeathers: dailyWeathers,
          lastFetched: DateTime.now());
    } catch (err) {
      print(err);
    }
  }
}

final weatherProvider = NotifierProvider<WeatherStateNotifier, WeatherState>(
    WeatherStateNotifier.new);
