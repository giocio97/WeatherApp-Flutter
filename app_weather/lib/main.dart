import 'package:app_weather/pages/city_datail_page.dart';
import 'package:app_weather/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.route,
      onGenerateRoute: (settings) {
        final routes = {
          HomePage.route: (context) => HomePage(),
          CityDetails.route: (context) => CityDetails(
                args: settings.arguments as CityDetailsArgs,
              ),
        };
        return MaterialPageRoute(builder: routes[settings.name]!);
      },
    );
  }
}
