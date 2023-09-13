import 'package:app_weather/models/ForecastData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineHourly extends StatelessWidget {
  final List<HourlyData> hourlyForecasts;

  const TimelineHourly({required this.hourlyForecasts});

  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: Padding(
        padding: EdgeInsets.all(10),
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          
          slivers: [
            SliverList(

              delegate: SliverChildBuilderDelegate((context, index) {
                final forecast = hourlyForecasts[index];
                final formattedTime = DateFormat('HH:mm').format(
                  DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000),
                );
      
                return TimelineTile(
                  axis: TimelineAxis.horizontal,
                  alignment: TimelineAlign.center,
                  startChild: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Center(child: Text('$formattedTime', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white), )),
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Center(
                      child: Text('${forecast.main.temp.toStringAsFixed(0)}°C', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300,  color: Colors.white),),
                    ),
                  ),
                  beforeLineStyle: LineStyle(color: Colors.white),
                  indicatorStyle: IndicatorStyle(
                    color: Colors.white,
                    
                  ),
                );
              }, childCount: hourlyForecasts.length),
            ),
          ],
        ),
      ),
    );
  }
}
