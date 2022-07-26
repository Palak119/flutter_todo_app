import '../custom_imports.dart';

Widget buildTextField(
  BuildContext context,
  TextEditingController controller,
  TextInputType textInputType,
  TextInputAction textInputAction,
  bool obscure,
  Color fillColor,
  Color cursorColor,
  int maxLength,
  String hint,
  bool isEnabled, {
  focusNode,
  required onChange,
  required onSubmit,
  int? minLines,
}) {
  return TextField(
    autofocus: false,
    obscureText: obscure,
    controller: controller,
    keyboardType: textInputType,
    textInputAction: textInputAction,
    cursorColor: cursorColor,
    maxLength: maxLength,
    style: bodyMediumTextStyle(context),
    minLines: minLines ?? 1,
    maxLines: minLines ?? 1,
    decoration: InputDecoration(
      counterText: '',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      fillColor: fillColor,
      filled: true,
      hintText: hint,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      hintStyle:
          bodyMediumTextStyle(context).copyWith(color: Colors.grey.shade400),
      contentPadding: EdgeInsets.only(
        top: sizeHeight(28),
        left: sizeHeight(28),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 3,
          )),
    ),
    enabled: isEnabled,
    focusNode: focusNode,
    onChanged: (v) {
      onChange(v);
    },
    onSubmitted: (v) {
      onSubmit();
    },
  );
}
