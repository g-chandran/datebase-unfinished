import 'package:datebase/utilities/overlay_manager.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DatepickerButtons extends StatelessWidget {
  const DatepickerButtons(
      {Key key, @required this.overlayManager, this.okOperation = false})
      : super(key: key);

  final OverlayManager overlayManager;
  final bool okOperation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        okOperation ? print('Ok') : print('cancel');
        overlayManager.removeOverlay();
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
