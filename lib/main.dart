import 'package:bc_app/splashscreen/mysplashscreen.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MYAPP());
}

class MYAPP extends StatefulWidget {
  @override
  _MYAPPState createState() => _MYAPPState();
}

class _MYAPPState extends State<MYAPP> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breast Cancer',
      home: Splashscreen(),
    );
  }
}
