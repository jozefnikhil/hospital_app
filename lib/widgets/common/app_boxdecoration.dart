import 'package:amrita_treatment/core/app_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration appboxdecoration({
  Color color = AppColors.buttoncolor,
  double radius = 15,
  double sr = 1,
  double br = 2,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    border: border,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withAlpha(26),
        spreadRadius: sr,
        blurRadius: br,
        offset: Offset(0, 1),
      ),
    ],
  );
}
