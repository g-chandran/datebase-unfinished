import 'package:datebase/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:datebase/utilities/month_info.dart';

import 'datepicker_helper.dart';

class DatePicker extends StatefulWidget {
  final BuildContext datePickerContext;

  const DatePicker({Key key, this.datePickerContext}) : super(key: key);
  @override
  _DatePickerState createState() => _DatePickerState();
}

int maxDates = 31;
int finalMonth = 1, finalDate = 1;
// int chosenMonth = finalMonth;
int chosenDate = finalDate;
const double kDatePickerHeight = 423.0;
const double kDatePickerWidth = 410.0;

class _DatePickerState extends State<DatePicker> {
  String _setNumber(int value) {
    String x = value.toString();
    if (x.length == 1) return '0' + x;
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          SizedBox(height: 75),
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
                      finalMonth = value + 1;
                      setState(() {
                        maxDates = dateInfo[value][months[value]];
                        if (finalDate > maxDates) {
                          finalDate = maxDates;
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
                              setState(() {
                                finalDate = i;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: i == finalDate
                                  ? ChosenDate(i: i)
                                  : NonChosenDate(i: i),
                            ),
                          ),
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
                        month: _setNumber(finalMonth),
                        date: _setNumber(finalDate),
                        okOperation: true,
                      ),
                      DatepickerButtons(
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
