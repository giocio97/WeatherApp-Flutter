import 'package:app_weather/components/bottom_footer_bar.dart';
import 'package:app_weather/components/timeline_hourly.dart';
import 'package:app_weather/components/weekly_forecast_card.dart';
import 'package:app_weather/models/weather_listing_model.dart';
import 'package:app_weather/themes/colors.dart';
import 'package:flutter/material.dart';

class CityDetails extends StatelessWidget {
  static const route = "/city/details";
  final CityDetailsArgs args;

  const CityDetails({
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackgroundColorItem,
      body: Stack(
        children: [
          header(),
          temperatureIcon(),
          TimelineHourly(), 
          Center(child: WeeklyForecastCard()), 
        ],
      ),
      bottomNavigationBar: BottomFooterBar(),
    );
  }

  Widget header() => SafeArea(
        child: Container(
          width: double.infinity,
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                ),
                color: Colors.white,
                iconSize: 30,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      args.cityName,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      args.formattedDate,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      args.weatherDescription,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ]),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_box_outlined),
                color: Colors.white,
                iconSize: 30,
              ),
            ],
          ),
        ),
      );

  Widget temperatureIcon() => Positioned(
        top: 0,
        bottom: 250,
        right: 0,
        left: 0,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                args.iconUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              Text(
                '${args.temperature.round()}°',
                style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      );
}

class CityDetailsArgs {
  final String cityName;
  final String formattedDate;
  final String weatherDescription;
  final String iconUrl;
  final double temperature;
  final List<HourlyForecast> hourlyForecasts; 
  final List<DailyForecast> dailyForecasts;   

  const CityDetailsArgs({
    required this.cityName,
    required this.formattedDate,
    required this.weatherDescription,
    required this.iconUrl,
    required this.temperature,
    required this.hourlyForecasts,              
    required this.dailyForecasts,                
  });
}
