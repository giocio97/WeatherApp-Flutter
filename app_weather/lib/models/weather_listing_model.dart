import 'package:intl/intl.dart';

class WeatherListingModel {
  final String cityName;
  final double temperature;
  final String weatherDescription;
  final String iconUrl;
  final DateTime date;
  final String currentTime;
  final String formattedDate;
  final List<HourlyForecast> hourlyForecasts;
  final List<DailyForecast> dailyForecasts;

  WeatherListingModel({
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
    required this.iconUrl,
    required this.date,
    required this.currentTime,
    required this.formattedDate,
    required this.hourlyForecasts,
    required this.dailyForecasts,
  });

  factory WeatherListingModel.fromJson(Map<String, dynamic> json) {
    final date = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000);
    final formattedDate = DateFormat('EEEE d, MMMM').format(date);

    final List<HourlyForecast> hourlyForecasts =
        (json['hourly'] as List<dynamic>?)
                ?.map((hourlyData) => HourlyForecast.fromJson(hourlyData))
                .toList() ??
            [];

    final List<DailyForecast> dailyForecasts = (json['daily'] as List<dynamic>?)
            ?.map((dailyData) => DailyForecast.fromJson(dailyData))
            .toList() ??
        [];

    return WeatherListingModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
      iconUrl:
          'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}.png',
      date: date,
      currentTime: DateFormat('hh:mm a').format(DateTime.now()),
      formattedDate: formattedDate,
      hourlyForecasts: hourlyForecasts,
      dailyForecasts: dailyForecasts,
    );
  }
}

class HourlyForecast {
  final DateTime dateTime;
  final double temperature;
  final String iconUrl;

  HourlyForecast({
    required this.dateTime,
    required this.temperature,
    required this.iconUrl,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000);
    return HourlyForecast(
      dateTime: dateTime,
      temperature: json['temp'].toDouble(),
      iconUrl:
          'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}.png',
    );
  }
}

class DailyForecast {
  final DateTime date;
  final double temperature;
  final String weatherDescription;
  final String iconUrl;

  DailyForecast({
    required this.date,
    required this.temperature,
    required this.weatherDescription,
    required this.iconUrl,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    final date = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000);
    return DailyForecast(
      date: date,
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
      iconUrl:
          'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}.png',
    );
  }
}
