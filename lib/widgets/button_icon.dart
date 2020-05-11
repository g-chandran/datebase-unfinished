import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final IconData iconData;
  final Function onTap;
  final double sizeInfo;
  final Color colorData;

  const ButtonIcon(
      {@required this.iconData,
      this.onTap,
      @required this.sizeInfo,
      this.colorData = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        iconData,
        size: sizeInfo,
        color: colorData,
      ),
    );
  }
}
