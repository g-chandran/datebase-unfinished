import 'package:flutter/material.dart';
import 'package:datebase/constants.dart';
import 'package:datebase/widgets/button_icon.dart';
import 'package:datebase/screens/homepage.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
