import 'package:datebase/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:datebase/utilities/month_info.dart';
import 'package:datebase/utilities/overlay_manager.dart';

import 'datepicker_buttons.dart';

class DatePicker extends StatefulWidget {
  final BuildContext datePickerContext;

  const DatePicker({Key key, this.datePickerContext}) : super(key: key);
  @override
  _DatePickerState createState() => _DatePickerState();
}

int maxDates = 31;
int chosenMonth = 1, chosenDate = 1;
const double kDatePickerHeight = 423.0;
const double kDatePickerWidth = 410.0;

class _DatePickerState extends State<DatePicker> {
  String _setNumber(String x) {
    if (x.length == 1) return '0' + x;
    return x;
  }

  int chosenDate = 1;
  @override
  Widget build(BuildContext context) {
    OverlayManager overlayManager =
        OverlayManager(context: widget.datePickerContext);
    return Material(
      elevation: 14.0,
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kBlue,
            ),
            width: kDatePickerWidth,
            height: kDatePickerHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Expanded(
                  flex: 1,
                  child: Swiper(
                    control: SwiperControl(color: Colors.grey[800]),
                    itemCount: months.length,
                    onIndexChanged: (value) {
                      chosenMonth = value + 1;
                      print(_setNumber(chosenMonth.toString()));
                      setState(() {
                        maxDates = dateInfo[value][months[value]];
                        if (chosenDate > maxDates) {
                          chosenDate = maxDates;
                        }
                      });
                    },
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          months[index].toString(),
                          style: kHeading.copyWith(
                              fontSize: 40, color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                    child: GridView.count(
                      addAutomaticKeepAlives: true,
                      crossAxisCount: 7,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 0,
                      children: <Widget>[
                        for (int i = 1; i <= maxDates; i++)
                          GestureDetector(
                              onTap: () {
                                print(i);
                                setState(() {
                                  chosenDate = i;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: i == chosenDate
                                    ? ChosenDate(i: i)
                                    : NonChosenDate(i: i),
                              )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 14.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      DatepickerButtons(
                        overlayManager: overlayManager,
                        okOperation: true,
                      ),
                      DatepickerButtons(
                        overlayManager: overlayManager,
                        okOperation: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
