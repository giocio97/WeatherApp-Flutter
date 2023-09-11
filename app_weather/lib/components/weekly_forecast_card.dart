import 'package:flutter/material.dart';

class WeeklyForecastCard extends StatelessWidget {
  const WeeklyForecastCard({super.key});

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
                (context, index) => Container(
                  margin: EdgeInsets.all(10),
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
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
                      Text("Lunedì"),
                      Text("30°"),
                      Image.network(
                        "https://static.vecteezy.com/system/resources/previews/009/344/657/original/sun-transparent-background-free-png.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                childCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}