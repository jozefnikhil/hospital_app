import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date/time

// Date picker function
void pickDate(BuildContext context, TextEditingController controller) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
    controller.text = formattedDate;
  }
}

void pickTime(BuildContext context, TextEditingController controller) async {
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (pickedTime != null) {
    final now = DateTime.now();
    final dt = DateTime(
      now.year,
      now.month,
      now.day,
      pickedTime.hour,
      pickedTime.minute,
    );
    String formattedTime = DateFormat(
      'hh:mm a',
    ).format(dt); // 12-hour format with AM/PM
    controller.text = formattedTime;
  }
}
