import 'package:bc_app/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
class Mysplashscreen extends StatefulWidget {
  @override
  _MysplashscreenState createState() => _MysplashscreenState();
}

class _MysplashscreenState extends State<Mysplashscreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      photoSize: 100,
      image: Image(fit: BoxFit.fill,
        image: AssetImage("app_images/newlogobreastcancer.png"),
      ),
      loaderColor: Colors.redAccent.shade400,
      title: Text("Welcome To My BCancer App",style: TextStyle(color: Colors.redAccent.shade400),),
      backgroundColor: Colors.white,
      loadingText: Text("Pleas Wait"),
      navigateAfterSeconds:Login(),
      seconds: 3,

    );
  }
}
