import 'package:app_weather/pages/home_page.dart';
import 'package:flutter/material.dart';

class BottomFooterBar extends StatelessWidget {
  final bool isHomePageSelected; 
  final bool isSearchPageSelected; 
  final bool isLocationPageSelected; 
  BottomFooterBar({
    required this.isHomePageSelected,
    required this.isSearchPageSelected,
    required this.isLocationPageSelected,
  });

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
              buildFooterIcon(
                icon: Icons.home_outlined,
                isSelected: isHomePageSelected,
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.route);
                },
              ),
              buildFooterIcon(
                icon: Icons.search_outlined,
                isSelected: isSearchPageSelected,
                onPressed: () {},
              ),
              buildFooterIcon(
                icon: Icons.location_on_outlined,
                isSelected: isLocationPageSelected,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildFooterIcon({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(bottom: isSelected ? 10 : 0),
        decoration: isSelected
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
              )
            : null,
        child: Icon(
          icon,
          size: 35,
          color: isSelected ? Colors.blue : Colors.black,
        ),
      ),
    );
  }
}
