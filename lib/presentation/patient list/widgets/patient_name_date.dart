import 'package:amrita_treatment/core/app_colors.dart';
import 'package:amrita_treatment/widgets/common/app_text.dart';
import 'package:flutter/material.dart';

Row patientnamedate({
  IconData icon = Icons.calendar_today_outlined,
  String text = "",
  double size = 15,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: AppColors.cardicon, size: size),
      SizedBox(width: 5),
      Flexible(
        child: Text15Normal(
          text: text,
          color: AppColors.carddatecolor,

          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
