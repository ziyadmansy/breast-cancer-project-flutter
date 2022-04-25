import 'package:bc_app/home.dart';
import 'package:bc_app/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      photoSize: 100,
      image: Image(
        fit: BoxFit.fill,
        image: AssetImage("app_images/newlogobreastcancer.png"),
      ),
      loaderColor: Colors.redAccent.shade400,
      title: Text(
        "Welcome To My BCancer App",
        style: TextStyle(color: Colors.redAccent.shade400),
      ),
      backgroundColor: Colors.white,
      loadingText: Text("Pleas Wait"),
      navigateAfterSeconds: HomeScreen(),
      seconds: 1,
    );
  }
}
