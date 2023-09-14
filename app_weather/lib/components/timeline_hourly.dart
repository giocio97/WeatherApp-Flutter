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
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final forecast = hourlyForecasts[index];
                  final currentTime = DateTime.now();
                  final forecastTime =
                      DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
                  final isPast = forecastTime.isBefore(currentTime);
                  final formattedTime =
                      DateFormat('HH:mm').format(forecastTime);

                  return MyTimelineTile(
                    isFirst: index == 0,
                    isLast: index == hourlyForecasts.length - 1,
                    isPast: isPast, 
                    temperature:
                        '${forecast.main.temp.toStringAsFixed(0)}°C',
                    time: formattedTime,
                  );
                },
                childCount: hourlyForecasts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String temperature;
  final String time;

  const MyTimelineTile({
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.temperature,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.center,
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: isPast ? Colors.white : Colors.white54,
      ),
      indicatorStyle: IndicatorStyle(
        width: isPast ? 30 : 20,
        color:Colors.white,
      ),
      startChild: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(right: 2),
        child: Center(
          child: Text(
            temperature,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
