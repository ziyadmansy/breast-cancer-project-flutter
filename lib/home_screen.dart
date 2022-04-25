import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'awareness.dart';
import 'scan_page.dart';
import 'general.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tab = [];
  int currentIndex = 0;

  void setCurrentIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    tab = [
      General(setCurrentIndex),
      Awareness(),
      ScanScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Breast Cancer Scanner'),
        backgroundColor: Colors.pink,
      ),
      body: ScanScreen(),
      // bottomNavigationBar: CurvedNavigationBar(
      //   index: currentIndex,
      //   height: 50,
      //   backgroundColor: Colors.pink,
      //   color: Colors.white,
      //   onTap: (int index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      //   items: [
      //     Column(
      //       children: [
      //         Icon(
      //           Icons.home,
      //           color: currentIndex == 0 ? Colors.pink : Colors.grey,
      //         ),
      //         Text(
      //           "Home",
      //           style: TextStyle(
      //             color: currentIndex == 0 ? Colors.pink : Colors.grey,
      //           ),
      //         )
      //       ],
      //     ),
      //     Column(
      //       children: [
      //         Icon(
      //           Icons.auto_awesome_rounded,
      //           color: currentIndex == 1 ? Colors.pink : Colors.grey,
      //         ),
      //         Text(
      //           "Awareness",
      //           style: TextStyle(
      //             color: currentIndex == 1 ? Colors.pink : Colors.grey,
      //           ),
      //         ),
      //       ],
      //     ),
      //     Column(
      //       children: [
      //         Icon(
      //           Icons.search,
      //           color: currentIndex == 2 ? Colors.pink : Colors.grey,
      //         ),
      //         Text(
      //           "Scan",
      //           style: TextStyle(
      //             color: currentIndex == 2 ? Colors.pink : Colors.grey,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      
    );
  }
}
