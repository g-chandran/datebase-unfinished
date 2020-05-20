import 'package:flutter/material.dart';
import 'package:datebase/utilities/constants.dart';

class DashboardCards extends StatelessWidget {
  final content;

  DashboardCards({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kBlue,
      ),
      width: 190,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              content.value.toString(),
              style: kBigText,
            ),
            Text(
              content.key,
              style: TextStyle(
                color: Colors.black,
                fontFamily: kFontFamily,
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
