import '../custom_imports.dart';

Widget buildCustomButton(BuildContext context, IconData icon, String buttonText,
    Color buttonBGColor, Color buttonChildrenColor,
    {required Function onTap}) {
  return Material(
    color: Colors.transparent,
    child: Container(
      height: sizeWidth(60),
      width: SizeUtil.screenWidth * 0.7,
      decoration: BoxDecoration(
        color: buttonBGColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: buttonChildrenColor.withOpacity(0.4),
          highlightColor: buttonChildrenColor.withOpacity(0.2),
          hoverColor: buttonChildrenColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          onTap: () => onTap(),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              color: buttonChildrenColor,
            ),
            horizontalSpace(context, 0.02),
            Text(buttonText,
                style: bodyLargeTextStyle(context).copyWith(
                  color: buttonChildrenColor,
                )),
          ]),
        ),
      ),
    ),
  );
}
