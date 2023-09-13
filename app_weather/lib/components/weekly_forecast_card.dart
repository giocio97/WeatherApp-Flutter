import 'package:app_weather/models/ForecastData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeeklyForecastCard extends StatelessWidget {
  final List<DailyData> dailyForecasts;

  const WeeklyForecastCard({required this.dailyForecasts});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0.0),
        height: 250,
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final forecast = dailyForecasts[index];

                  final forecastTime =
                      DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
                  final formattedDay =
                      DateFormat('EEEE', 'en_US').format(forecastTime);

                  final iconUrl = forecast.weather[0].icon;

                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 150,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(67, 255, 255, 255),
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$formattedDay', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
                        SizedBox(height: 30,),
                        Text('${forecast.main.temp.toStringAsFixed(0)}°C', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                        Image.network(
                          'https://openweathermap.org/img/w/${iconUrl}.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  );
                },
                childCount: dailyForecasts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
