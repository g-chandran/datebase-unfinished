import 'package:datebase/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/homepage.dart';
import 'constants.dart';

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
      theme: ThemeData.light().copyWith(primaryColor: Colors.white),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: () => print('Today'),
              child: Tooltip(
                message: 'Today',
                child: Text(
                  'Datebase',
                  style: kHeading,
                ),
              ),
            ),
            actions: <Widget>[
              Tooltip(
                message: 'Choose date',
                child: ButtonIcon(
                  iconData: Icons.calendar_today,
                  sizeInfo: 31,
                  onTap: () {
                    print('Calendar tapped');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Tooltip(
                  message: 'Settings and more',
                  child: ButtonIcon(
                    iconData: Icons.more_vert,
                    sizeInfo: 34,
                    onTap: () {
                      print('More tapped');
                    },
                  ),
                ),
              ),
            ],
          ),
          body: HomePage(),
        ),
      ),
    );
  }
}
