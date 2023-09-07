import 'package:app_weather/components/bottom_footer_bar.dart';
import 'package:app_weather/models/weather_listing_model.dart';
import 'package:app_weather/pages/city_datail_page.dart';
import 'package:app_weather/repositories/weatherRepository.dart';
import 'package:app_weather/themes/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const route = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherRepository _repository = WeatherRepository();
  List<String> cities = ['Rome', 'Paris', 'Milan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackgroundColorHome,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            header(),
          ],
        ),
      ),
      bottomNavigationBar: BottomFooterBar(),
    );
  }

  Widget header() => Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Good Moornig!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 4, 55, 131),
                  ),
                ),
                Text(
                  "Mario",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 4, 55, 131),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_box_outlined,
                    size: 25,
                    color: Color.fromARGB(255, 4, 55, 131),
                  ),
                  label: Text(
                    "Aggiungi Città",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 4, 55, 131),
                    ),
                  ),
                ),
                body(),
              ],
            ),
          ),
        ),
      );

  Widget body() => Expanded(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => FutureBuilder(
                        future: _repository.getWeatherByCity(cities[index]),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final weather =
                                snapshot.data as WeatherListingModel;
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  CityDetails.route,
                                  arguments: CityDetailsArgs(cityName: weather.cityName, formattedDate: weather.formattedDate, weatherDescription: weather.weatherDescription, iconUrl: weather.iconUrl, temperature: weather.temperature),
                                );
                              },
                              child: Container(
                                width: 300,
                                height: 150,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 151, 197, 230),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0.0, 0.0),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            weather.cityName,
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            weather.formattedDate,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            weather.currentTime,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      Image(
                                        image: NetworkImage(
                                          weather.iconUrl,
                                        ),
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        "${(weather.temperature).round()}°",
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                  childCount: cities.length),
            ),
          ],
        ),
      );
}
