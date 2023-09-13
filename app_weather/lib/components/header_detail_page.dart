import 'package:app_weather/pages/city_datail_page.dart';
import 'package:app_weather/pages/home_page.dart';
import 'package:flutter/material.dart';
class HeaderDetailPage extends StatelessWidget {
  final CityDetailsArgs args;
  const HeaderDetailPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: double.infinity,
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.route);
                },
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
  }
}