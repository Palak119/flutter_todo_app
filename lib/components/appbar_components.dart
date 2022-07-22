import 'package:flutter/material.dart';

import '../colors/colors.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: primaryColor,
    title: Text(
      title,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.longestSide * 0.020,
      ),
    ),
    centerTitle: true,
  );
}
