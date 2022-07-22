import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showInfoToast(BuildContext context, String message) {
  if (Platform.isMacOS) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black87,
            fontSize: MediaQuery.of(context).size.longestSide * 0.018,
          ),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
    );
    return;
  }

  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.black87,
    backgroundColor: Colors.grey.shade200,
    gravity: ToastGravity.BOTTOM,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
  );
}

void showSuccessToast(BuildContext context, String message) {
  if (Platform.isMacOS) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.longestSide * 0.018,
          ),
        ),
        backgroundColor: Colors.green.shade700,
      ),
    );
    return;
  }

  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: Colors.green.shade700,
    gravity: ToastGravity.BOTTOM,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
  );
}

void showErrorToast(BuildContext context, String message) {
  if (Platform.isMacOS) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.longestSide * 0.018,
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: Colors.red,
    gravity: ToastGravity.BOTTOM,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
  );
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}
