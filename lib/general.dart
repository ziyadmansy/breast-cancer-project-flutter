import 'package:bc_app/home_screen.dart';
import 'package:flutter/material.dart';

import 'awareness.dart';
import 'scan_page.dart';

class General extends StatefulWidget {
  Function setIndex;
  General(this.setIndex);
  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              "Hello!",
              style: TextStyle(color: Colors.pinkAccent, fontSize: 30),
            ),
          ),
          Container(
            height: screenHeight * 0.15,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Column(
              children: [
                Text(
                  "Help Support Women In Need",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "We provide help and inspire hope to those affected by breast cancer through early detection, education, and support services",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            height: screenHeight * 0.15,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Column(
              children: [
                Text(
                  "We Are Making Progress",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Breast cancer death rates declined 40% from 2018 to 2021 among women. The progress is attributed to improvements in early detection.",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
