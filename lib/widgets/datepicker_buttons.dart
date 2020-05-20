import 'package:flutter/material.dart';

import '../constants.dart';

class DatepickerButtons extends StatelessWidget {
  const DatepickerButtons(
      {Key key, this.okOperation = false, this.date, this.month})
      : super(key: key);

  final bool okOperation;
  final String date, month;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (okOperation) {
          print('Ok\nMonth: $month, Date: $date');
        } else {
          print('Cancel');
        }
        Navigator.pop(context);
      },
      child: Container(
        height: 43,
        width: 100,
        decoration: BoxDecoration(
          color: okOperation ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
            child: Text(
          okOperation ? 'Search' : 'Cancel',
          style: TextStyle(
              color: okOperation ? kBlue : Colors.white,
              fontFamily: kFontFamily,
              fontSize: 20),
        )),
      ),
    );
  }
}
