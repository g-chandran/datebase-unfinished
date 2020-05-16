import 'package:datebase/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:datebase/utilities/month_info.dart';

class TestDatePicker extends StatefulWidget {
  @override
  _TestDatePickerState createState() => _TestDatePickerState();
}

int maxDates = 31;
int chosenMonth = 0, chosenDate = 0;

class _TestDatePickerState extends State<TestDatePicker> {
  String _setNumber(String x) {
    if (x.length == 1) return '0' + x;
    return x;
  }

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height - 480;
    print(hight);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.green,
      ),
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height - 480,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Swiper(
              control: SwiperControl(),
              itemCount: months.length,
              onIndexChanged: (value) {
                chosenMonth = value + 1;
                print(_setNumber(chosenMonth.toString()));
                setState(() {
                  maxDates = dateInfo[value][months[value]];
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    months[index].toString(),
                    style: kHeading.copyWith(fontSize: 40, color: Colors.white),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(14),
              child: GridView.count(
                crossAxisCount: 7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 0,
                children: <Widget>[
                  for (int i = 1; i <= maxDates; i++)
                    GestureDetector(
                      onTap: () => print(_setNumber(i.toString())),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          i.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
