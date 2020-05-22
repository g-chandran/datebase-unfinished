import 'package:datebase/utilities/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:datebase/utilities/constants.dart';

NetworkHelper networkHelper = NetworkHelper();

class ChosenDate extends StatelessWidget {
  const ChosenDate({Key key, @required this.i}) : super(key: key);
  final int i;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 21,
      child: Text(
        i.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 21,
          color: Colors.black,
          fontFamily: kFontFamily,
        ),
      ),
    );
  }
}

class NonChosenDate extends StatelessWidget {
  final int i;
  const NonChosenDate({Key key, this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      i.toString(),
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontFamily: kFontFamily,
      ),
    );
  }
}

class DatepickerButtons extends StatelessWidget {
  const DatepickerButtons(
      {Key key, this.okOperation = false, this.date, this.month})
      : super(key: key);

  final bool okOperation;
  final String date, month;

  @override
  Widget build(BuildContext context) {
    void getter() async {
      await networkHelper.getResponse(date: date, month: month);
    }

    return GestureDetector(
      onTap: () {
        if (okOperation) {
          print('Ok\nMonth: $month, Date: $date');
          getter();
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
