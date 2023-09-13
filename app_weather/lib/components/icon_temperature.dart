import 'package:app_weather/pages/city_datail_page.dart';
import 'package:flutter/material.dart';

class IconTemperature extends StatelessWidget {
   final CityDetailsArgs args;
  const IconTemperature({super.key, required this.args });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              args.iconUrl,
              width: 150,
              height: 150,
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
      );
}
  }
