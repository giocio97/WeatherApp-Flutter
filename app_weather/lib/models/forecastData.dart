import 'package:intl/intl.dart';

class Forecast {
  String cod;
  int message;
  int cnt;
  List<HourlyData> hourly;
  List<DailyData> daily;
  City city;

  Forecast({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.hourly,
    required this.daily,
    required this.city,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      hourly: (json['list'] as List)
          .map((hourlyData) => HourlyData.fromJson(hourlyData))
          .toList(),
      daily: (json['list'] as List)
          .map((dailyData) => DailyData.fromJson(dailyData))
          .toList(),
      city: City.fromJson(json['city']),
    );
  }
}

class HourlyData {
  int dt;
  Main main;
  List<Weather> weather;
  Wind wind;
  Rain? rain;

  HourlyData({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind,
    this.rain,
  });

  String get formattedTime {
  
    return DateFormat('HH:mm').format(
      DateTime.fromMillisecondsSinceEpoch(dt * 1000),
    );
  }

  factory HourlyData.fromJson(Map<String, dynamic> json) {
    return HourlyData(
      dt: json['dt'],
      main: Main.fromJson(json['main']),
      weather: (json['weather'] as List)
          .map((weather) => Weather.fromJson(weather))
          .toList(),
      wind: Wind.fromJson(json['wind']),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
    );
  }
}

class DailyData {
  int dt;
  Main main;
  List<Weather> weather;
  Wind wind;
  Rain? rain;

  DailyData({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind,
    this.rain,
  });

  String get formattedDate {
  
    return DateFormat('dd/MM/yyyy').format(
      DateTime.fromMillisecondsSinceEpoch(dt * 1000),
    );
  }

  factory DailyData.fromJson(Map<String, dynamic> json) {
    return DailyData(
      dt: json['dt'],
      main: Main.fromJson(json['main']),
      weather: (json['weather'] as List)
          .map((weather) => Weather.fromJson(weather))
          .toList(),
      wind: Wind.fromJson(json['wind']),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
    );
  }
}




class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
      humidity: json['humidity'],
      tempKf: json['temp_kf'].toDouble(),
    );
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust'].toDouble(),
    );
  }
}

class Rain {
  double the3H;

  Rain({
    required this.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      the3H: json['3h'].toDouble(),
    );
  }
}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class Coord {
  double lat;
  double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
    );
  }
}
