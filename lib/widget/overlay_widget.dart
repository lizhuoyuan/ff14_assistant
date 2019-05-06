import 'package:flutter/material.dart';

class OverlayWidget {
  static OverlayEntry overlayEntry;

  static void show(
    BuildContext context, {
    double width = 250,
    double height = 250,
    bool autoDismiss = true,
  }) {
    // if (overlayEntry == null) {
    overlayEntry = buildOverlay(width: width, height: height);
    // }
    Overlay.of(context).insert(overlayEntry);
    if (autoDismiss) Future.delayed(Duration(seconds: 2), dismiss);
  }

  static void dismiss() {
    overlayEntry.remove();
  }

  static buildOverlay({double width, double height}) {
    return OverlayEntry(
        builder: (context) => Center(
              child: Material(
                color: Colors.white.withOpacity(0),
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height,
                  color: Color(0x99000000),
                  child: Text(
                    '没开发完呢啊!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ));
  }
}
