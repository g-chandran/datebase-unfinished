import 'package:flutter/material.dart';
// Constants
import 'package:datebase/constants.dart';

// Widgets
import 'package:datebase/widgets/button_icon.dart';
import 'package:datebase/widgets/dashboard_card.dart';

Map<String, int> boxContent = {
  'Births': 219,
  'Events': 38,
  'Holidays': 7,
  'Deaths': 95,
};

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Datebase',
            style: kHeading,
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
              child: ButtonIcon(
                iconData: Icons.more_vert,
                sizeInfo: 34,
                onTap: () {
                  print('More tapped');
                },
              ),
            ),
          ],
        ),
        body: Padding(
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
                      ButtonChanges(),
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
                          color: Colors.black,
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
                children: boxContent.entries
                    .map((MapEntry content) => DashboardCards(
                          content: content,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonChanges extends StatefulWidget {
  @override
  _ButtonChangesState createState() => _ButtonChangesState();
}

class _ButtonChangesState extends State<ButtonChanges> {
  IconData toggleBookmark = Icons.bookmark_border;
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonIcon(
          iconData: isBookmarked ? Icons.bookmark : Icons.bookmark_border,
          sizeInfo: 41,
          colorData: kWhite,
          onTap: () {
            setState(() {
              isBookmarked = !isBookmarked;
            });
            if (isBookmarked) {
              print('Bookmarked');
            } else {
              print('Bookmark removed');
            }
          },
        ),
        SizedBox(height: 10.0),
        ButtonIcon(
          iconData: Icons.search,
          sizeInfo: 41,
          colorData: kWhite,
        ),
      ],
    );
  }
}
