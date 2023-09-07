import 'package:app_weather/pages/home_page.dart';
import 'package:flutter/material.dart';

class BottomFooterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(0.0, 0.0),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.route);
                },
                icon: Icon(Icons.home_outlined, size: 35),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search_outlined, size: 35),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on_outlined,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
