import 'package:flutter/material.dart';
import 'package:datebase/utilities/constants.dart';

SnackBar showSnackBar({@required String bookmarkInfo}) {
  return SnackBar(
    content: Text(
      bookmarkInfo ?? ' ',
      style: kHeading.copyWith(color: Colors.white, fontSize: 27),
    ),
    duration: Duration(seconds: 1),
    elevation: 2.0,
  );
}
