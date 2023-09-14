import 'package:app_weather/components/bottom_footer_bar.dart';
import 'package:app_weather/components/header_detail_page.dart';
import 'package:app_weather/components/icon_temperature.dart';
import 'package:app_weather/components/timeline_hourly.dart';
import 'package:app_weather/components/weekly_forecast_card.dart';
import 'package:app_weather/models/ForecastData.dart';
import 'package:app_weather/repositories/weather_repository.dart';
import 'package:app_weather/themes/colors.dart';
import 'package:flutter/material.dart';

class CityDetails extends StatelessWidget {
  static const route = "/city/details";
  final CityDetailsArgs args;
  final WeatherRepository _repository = WeatherRepository();

  CityDetails({
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackgroundColorItem,
      body: FutureBuilder(
        future: _repository.getWeatherForecast(args.cityName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Errore: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('Nessun dato disponibile');
          }

          final data = snapshot.data!;

          final now = DateTime.now();

          final hourlyForecastsToday = data.hourly.where((hourlyData) {
            final forecastTime =
                DateTime.fromMillisecondsSinceEpoch(hourlyData.dt * 1000);
            return forecastTime.day == now.day;
          }).toList();

          final dailyForecasts = data.daily
              .fold<Map<int, DailyData>>({}, (map, dailyData) {
                final forecastTime =
                    DateTime.fromMillisecondsSinceEpoch(dailyData.dt * 1000);
                final day = forecastTime.day;
                if (!map.containsKey(day)) {
                  map[day] = dailyData;
                }
                return map;
              })
              .values
              .toList();

          return Column(
            children: [
              HeaderDetailPage(args: args),
              IconTemperature(args: args),
              TimelineHourly(hourlyForecasts: hourlyForecastsToday),
              WeeklyForecastCard(dailyForecasts: dailyForecasts),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomFooterBar(isHomePageSelected: false, isLocationPageSelected: false, isSearchPageSelected: false),
    );
  }
}

class CityDetailsArgs {
  final String cityName;
  final String formattedDate;
  final String weatherDescription;
  final String iconUrl;
  final double temperature;

  const CityDetailsArgs({
    required this.cityName,
    required this.formattedDate,
    required this.weatherDescription,
    required this.iconUrl,
    required this.temperature,
  });
}
