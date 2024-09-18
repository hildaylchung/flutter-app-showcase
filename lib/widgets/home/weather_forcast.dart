// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../config.dart';
import '../../provider/weather.dart';
import '../basic_section_wrapper.dart';

class WeatherSection extends ConsumerWidget {
  const WeatherSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WeatherState weatherState = ref.watch(weatherProvider);

    if (weatherState.needRefetch || weatherState.lastFetched == null) {
      if (weatherState.needRefetch) {
        ref.read(weatherProvider.notifier).getWeather();
      }
      return const Center(child: CircularProgressIndicator());
    }
    return BasicSectionWrapper(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 10),
        Text('Current Temperature', style: AppTextStyle.title),
        const SizedBox(height: 10),
        Text(weatherState.currentTemp.toString(),
            style: AppTextStyle.emphasizedNumber),
        const SizedBox(height: 10),
        const Text('Weather Forecast:'),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                    spacing: 12,
                    children: (weatherState.dailyWeathers ?? [])
                        .map((w) => DailyWeatherCell(dailyWeather: w))
                        .toList())),
          ),
        ]),
      ]),
    );
  }
}

class DailyWeatherCell extends StatelessWidget {
  final DailyWeather dailyWeather;

  const DailyWeatherCell({super.key, required this.dailyWeather});

  String dateStr() {
    if (dailyWeather.date.day == DateTime.now().day) {
      return 'Today';
    }
    return dailyWeather.date.day.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(dateStr(), style: AppTextStyle.title.copyWith()),
      const SizedBox(height: 10),
      Text(dailyWeather.maxTemp.toString(), style: AppTextStyle.bodyDarker),
      const SizedBox(height: 10),
      Text(dailyWeather.minTemp.toString(), style: AppTextStyle.bodyDarker)
    ]);
  }
}
