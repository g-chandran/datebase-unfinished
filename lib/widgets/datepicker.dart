import 'package:datebase/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:datebase/utilities/month_info.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'datepicker_helper.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

int _maxDates = 31;
int _finalMonth = 1, _finalDate = 1;
int _temp = 0, _chosenIndex = 0;
const double _kDatePickerHeight = 410.0;
const double _kDatePickerWidth = 410.0;

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
            width: _kDatePickerWidth,
            height: _kDatePickerHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Expanded(
                  flex: 1,
                  child: CarouselSlider.builder(
                    carouselController: CarouselController(),
                    itemCount: months.length,
                    itemBuilder: (context, index) {
                      return Text(
                        months[index].toString(),
                        style: kHeading.copyWith(
                          fontSize: 40,
                          color: index == _chosenIndex ? kBlack : Colors.white,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 50,
                      initialPage: _temp,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.25,
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        setState(() {
                          _chosenIndex = index;
                          _finalMonth = index + 1;
                          _maxDates = dateInfo[index][months[index]];
                          if (_finalDate > _maxDates) {
                            _finalDate = _maxDates;
                          }
                        });
                        _temp = index;
                      },
                    ),
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
                        for (int i = 1; i <= _maxDates; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _finalDate = i;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: i == _finalDate
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
                        month: _setNumber(_finalMonth),
                        date: _setNumber(_finalDate),
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
