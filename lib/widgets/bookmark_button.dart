import 'package:flutter/material.dart';
import '../constants.dart';
import 'button_icon.dart';
import 'package:datebase/utilities/snackbar.dart';

class BookmarkButton extends StatefulWidget {
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  IconData toggleBookmark = Icons.bookmark_border;
  bool isBookmarked = false;
  String bookmarkInfo;
  @override
  Widget build(BuildContext context) {
    return ButtonIcon(
      iconData: isBookmarked ? Icons.bookmark : Icons.bookmark_border,
      sizeInfo: 41,
      colorData: kWhite,
      onTap: () {
        setState(() {
          isBookmarked = !isBookmarked;
          bookmarkInfo = isBookmarked ? 'Bookmarked' : 'Bookmark Removed';
          Scaffold.of(context)
              .showSnackBar(showSnackBar(bookmarkInfo: bookmarkInfo));
        });
      },
    );
  }
}
