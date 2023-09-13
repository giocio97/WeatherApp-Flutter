
import 'package:intl/intl.dart';

class WeatherListingModel {
  final String cityName;
  final double temperature;
  final String weatherDescription;
  final String iconUrl;
  final DateTime date;
  final String currentTime;
  final String formattedDate;
  final String main;
  

  WeatherListingModel(
      {required this.cityName,
      required this.temperature,
      required this.weatherDescription,
      required this.iconUrl,
      required this.date,
      required this.currentTime,
      required this.formattedDate,
      required this.main,
      });

  factory WeatherListingModel.fromJson(Map<String, dynamic> json) {
    final date = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000);
    final formattedDate = DateFormat('EEEE d, MMMM').format(date);

    return WeatherListingModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
      iconUrl:
          'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}.png',
      date: date,
      currentTime: DateFormat('hh:mm a').format(DateTime.now()),
      formattedDate: formattedDate,
      main: json['weather'][0]['main'],
    );
  }
}
