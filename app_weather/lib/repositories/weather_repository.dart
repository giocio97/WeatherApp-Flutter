import 'dart:convert';
import 'package:app_weather/models/weather_listing_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final String apiKey = '416aed05931c363b4465c316067bb62a';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherListingModel> getWeatherByCity(String city) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return WeatherListingModel.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
