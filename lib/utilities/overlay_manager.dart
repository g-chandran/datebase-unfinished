import 'package:flutter/material.dart';
import 'package:datebase/widgets/datepicker.dart';

class OverlayManager {
  final BuildContext context;
  OverlayManager({@required this.context});
  OverlayEntry overlayEntry;
  OverlayState overlayState;

  void showOverlay() {
    overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 88,
          right: 10,
          child: DatePicker(
            datePickerContext: context,
          ),
        );
      },
    );
    if (overlayEntry != null) {
      overlayState.insert(overlayEntry);
    }
  }

  void removeOverlay() {
    overlayEntry?.remove();
  }
}
