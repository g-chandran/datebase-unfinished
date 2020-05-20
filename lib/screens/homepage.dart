import 'package:datebase/widgets/bookmark_button.dart';
import 'package:datebase/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:datebase/utilities/constants.dart';
import 'package:datebase/widgets/dashboard_card.dart';

Map<String, int> kBoxContent = {
  'Births': 219,
  'Events': 38,
  'Holidays': 7,
  'Deaths': 95,
};

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: kBlue,
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'June 29',
                        style: kBigText,
                      ),
                      Text(
                        '316 Records',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 30.0,
                          fontFamily: kFontFamily,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      BookmarkButton(),
                      SizedBox(height: 10.0),
                      ButtonIcon(
                        iconData: Icons.search,
                        sizeInfo: 41,
                        colorData: kWhite,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Dashboard',
            style: kSubtitle,
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '14',
                    style: TextStyle(
                      fontSize: 70,
                      color: kBlack,
                      fontFamily: kFontFamily,
                    ),
                  ),
                  Text(
                    'Top picks',
                    style: kBigText,
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: kBlue,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          SizedBox(height: 10.0),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            direction: Axis.horizontal,
            children: kBoxContent.entries
                .map(
                  (MapEntry content) => DashboardCards(
                    content: content,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
