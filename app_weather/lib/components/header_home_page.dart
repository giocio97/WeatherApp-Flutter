import 'package:flutter/material.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            ],
          ),
        ),
      ),
    );
    
  }
}
