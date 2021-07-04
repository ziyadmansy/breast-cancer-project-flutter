import 'package:bc_app/login.dart';
import 'package:bc_app/splashscreen/mysplashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MYAPP());
  await Firebase.initializeApp();
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
      home: Mysplashscreen(),
    );
  }
}
