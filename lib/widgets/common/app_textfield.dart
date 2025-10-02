import 'package:amrita_treatment/core/app_colors.dart';
import 'package:amrita_treatment/widgets/common/app_text.dart';
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

Column appdropdownfield({
  String title = "",
  String hinttext = '',
  IconData? icon,
  bool readonly = false,
  String? value, // stores id or string
  required List<dynamic> items, // List<Map<String,String>> or List<String>
  Function(String?)? onchange,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text16Normal(text: title, fontWeight: FontWeight.w400),
      SizedBox(height: 10),
      SizedBox(
        height: 50,
        child: DropdownButtonFormField<String>(
          initialValue: items.isEmpty
              ? null
              : items.any(
                  (item) =>
                      (item is Map && item["id"] == value) ||
                      (item is String && item == value),
                )
              ? value
              : null,
          onChanged: (items.isEmpty || readonly) ? null : onchange,
          validator: validator,
          hint: Text14Normal(
            text: items.isEmpty ? "No data available" : hinttext,
            color: AppColors.hinttext,
          ),
          decoration: inputDecoration(hinttext: hinttext, icon: icon),
          isExpanded: true,
          items: items.isEmpty
              ? [
                  DropdownMenuItem<String>(
                    value: null,
                    child: Text("No data available"),
                  ),
                ]
              : items.map((item) {
                  if (item is Map<String, String>) {
                    return DropdownMenuItem<String>(
                      value: item["id"],
                      child: Text(
                        item["name"] ?? "Unknown",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    );
                  } else if (item is String) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    );
                  } else {
                    throw Exception("Unsupported item type in dropdown");
                  }
                }).toList(),
        ),
      ),
    ],
  );
}

Widget apptextfield2({
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

  return 
  
  SizedBox(
    height: 50,
    width: 124,
    child: TextFormField(
      keyboardType: type,initialValue: title,
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
  );
}
