import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'constants/routes.dart';
import 'constants/screen_routes.dart';
import 'styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: homeScreen,
      theme: themeData(false, context),
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
    );
  }
}
