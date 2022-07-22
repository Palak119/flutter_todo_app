import '../custom_imports.dart';

TextStyle bodyLargeTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge!;
}

TextStyle bodyMediumTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyMedium!;
}

TextStyle bodySmallTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodySmall!;
}

TextStyle titleMediumTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleMedium!;
}

TextStyle titleLargeTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge!;
}

TextStyle themeTextStyle() {
  return const TextStyle(
    fontFamily: poppinsFont,
  );
}
