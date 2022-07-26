import 'dart:async';

import 'package:flutter/material.dart';

import 'toast_animation.dart';

class ToastUtils {
  static late Timer toastTimer;
  static late OverlayEntry _overlayEntry;

  static void showCustomToast(BuildContext context, String message,
      Color backgroundColor, int duration) {
    if (!toastTimer.isActive) {
      _overlayEntry =
          createOverlayEntry(context, message, backgroundColor, duration);
      Overlay.of(context)!.insert(_overlayEntry);
      toastTimer = Timer(Duration(seconds: duration), () {
        _overlayEntry.remove();
      });
    }
  }

  static OverlayEntry createOverlayEntry(BuildContext context, String message,
      Color backgroundColor, int duration) {
    return OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50.0,
        width: MediaQuery.of(context).size.width - 20,
        left: 10,
        child: SlideInToastMessageAnimation(
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 15,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
          duration: duration,
        ),
      ),
    );
  }
}
