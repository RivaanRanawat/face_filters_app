import "package:flutter/material.dart";
import 'package:flutter_ar/camera_filters_screen.dart';
import "package:splashscreen/splashscreen.dart";

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterSeconds: CameraFilterScreen(),
      seconds: 3,
      title: Text(
        "Face Filters",
        style: TextStyle(
          fontSize: 55,
          color: Colors.deepPurpleAccent,
        ),
      ),
      image: Image.asset("assets/images/icon.png"),
      photoSize: 140,
      backgroundColor: Colors.white,
      loaderColor: Colors.deepPurple,
      loadingText: Text(
        "by Rivaan Ranawat",
        style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16),
      ),
    );
  }
}
