import 'package:flutter_todo_app/custom_imports.dart';

Widget horizontalSpace(BuildContext context, double horizontalSpace) {
  return SizedBox(
    width: MediaQuery.of(context).size.shortestSide * horizontalSpace,
  );
}

Widget verticalSpace(BuildContext context, double verticalSpace) {
  return SizedBox(
    height: MediaQuery.of(context).size.longestSide * verticalSpace,
  );
}