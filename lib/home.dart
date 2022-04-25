import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'awareness.dart';
import 'diagnosis.dart';
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
    // TODO: implement initState
    super.initState();
    tab = [
      General(setCurrentIndex),
      Awareness(),
      Home(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: DrawerHeader(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.pink[300],
                              child: Text(
                                "BCR",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("About"),
                leading: Icon(Icons.settings, color: Colors.pinkAccent),
                //trailing: Icon(Icons.list),
              ),
              ListTile(
                title: Text("Diagnosis"),
                leading:
                    Icon(Icons.account_box_sharp, color: Colors.pinkAccent),
                //trailing: Icon(Icons.account_box_sharp),
              ),
              ListTile(
                title: Text("Awareness"),
                leading: Icon(Icons.theaters, color: Colors.pinkAccent),
                //trailing: Icon(Icons.theaters),
              ),
              ListTile(
                title: Text("Others"),
                leading: Icon(Icons.add_circle_outline_rounded,
                    color: Colors.pinkAccent),
                //trailing: Icon(Icons.arrow_drop_down),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Breast Cancer'),
        backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.pink,
        color: Colors.white,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Column(
            children: [
              Icon(Icons.home,
                  color: currentIndex == 0 ? Colors.pink : Colors.black),
              Text(
                "Home",
                style: TextStyle(
                    color: currentIndex == 0 ? Colors.pink : Colors.black),
              )
            ],
          ),
          Column(
            children: [
              Icon(Icons.add_business_outlined,
                  color: currentIndex == 1 ? Colors.pink : Colors.black),
              Text(
                "Awareness",
                style: TextStyle(
                    color: currentIndex == 1 ? Colors.pink : Colors.black),
              ),
            ],
          ),
          Column(
            children: [
              Icon(Icons.search,
                  color: currentIndex == 2 ? Colors.pink : Colors.black),
              Text(
                "Scan",
                style: TextStyle(
                    color: currentIndex == 2 ? Colors.pink : Colors.black),
              ),
            ],
          ),
        ],
      ),
      body: tab[currentIndex],
    );
  }
}
