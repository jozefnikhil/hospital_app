import 'package:amrita_ayurveda/core/app_colors.dart';
import 'package:amrita_ayurveda/widgets/common/app_text.dart';
import 'package:flutter/material.dart';

Column apptextfield({
  String title = "",
  String hinttext = '',
  IconData? icon,
  bool readonly = false,
  TextEditingController? controller,
  Function()? func,
  void Function(String val)? onchange,
  String? Function(String?)? validator,
  TextInputType type = TextInputType.text,
}) {
  // format today's date

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text16Normal(text: title, fontWeight: FontWeight.w400),
      SizedBox(height: 10),
      SizedBox(
        height: 50,
        child: TextFormField(
          keyboardType: type,
          controller: controller,
          onTap: () {
            if (func != null) {
              func();
            }
          },
          maxLines: null,
          readOnly: readonly,
          onChanged: onchange,
          decoration: inputDecoration(hinttext: hinttext, icon: icon),
          validator: validator,
        ),
      ),
    ],
  );
}

InputDecoration inputDecoration({
  String hinttext = '',
  IconData? icon,
  double? radius,
}) {
  final effectiveRadius = radius ?? 8.52;
  return InputDecoration(
    hintText: hinttext,
    hintStyle: TextStyle(fontSize: 14, color: AppColors.hinttext),
    suffixIcon: icon != null ? Icon(icon) : null,

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(effectiveRadius),
      borderSide: BorderSide(color: AppColors.borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(effectiveRadius),
      borderSide: BorderSide(color: AppColors.borderColor),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(effectiveRadius),
      borderSide: BorderSide(color: AppColors.borderColor),
    ),
  );
}

Column apptextfieldbooking({
  String title = "",
  String hinttext = '',
  IconData? icon,
  bool readonly = false,
  TextEditingController? controller,
  Function()? func,
  void Function(String val)? onchange,
  String? Function(String?)? validator,
  TextInputType type = TextInputType.text,
}) {
  // format today's date

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text16Normal(text: title, fontWeight: FontWeight.w600),
      SizedBox(height: 10),
      TextFormField(
        keyboardType: type,
        controller: controller,
        onTap: () {
          if (func != null) {
            func();
          }
        },
        maxLines: null,
        readOnly: readonly,
        onChanged: onchange,
        decoration: inputDecoration(hinttext: hinttext, icon: icon),
        validator: validator,
      ),
    ],
  );
}
