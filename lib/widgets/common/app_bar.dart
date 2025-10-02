import 'package:amrita_treatment/core/app_colors.dart';
import 'package:flutter/material.dart';

AppBar buildAppbar({
  String title = '',
  Function()? notificationFunc,
  Function()? cartFunc,
  Function()? profileFunc,
  BuildContext? context,
}) {
  return AppBar(
    iconTheme: IconThemeData(color: AppColors.iconcolor),
    backgroundColor: AppColors.buttontextcolor,
    surfaceTintColor: AppColors.buttontextcolor,
    // Leading: Address with location icon

    // Make leading widget wider to accommodate address text

    // Actions: Notification, Cart, and Profile buttons
    actions: [
      // Notification Icon
      IconButton(
        onPressed: notificationFunc,
        icon: Icon(Icons.notifications_outlined, color: AppColors.iconcolor),
        tooltip: 'Notifications',
      ),

      SizedBox(width: 8), // Small padding on the right
    ],
  );
}
