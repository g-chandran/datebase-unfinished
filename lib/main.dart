import 'package:datebase/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        accentColor: Colors.blueAccent,
        primaryColor: Colors.white,
      ),
      home: Homepage(),
    );
  }
}
