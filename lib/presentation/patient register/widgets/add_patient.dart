import 'package:amrita_treatment/application/register%20patient/patient_counter_provider.dart';
import 'package:amrita_treatment/core/app_colors.dart';
import 'package:amrita_treatment/widgets/common/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget addPatientWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 20),
      Text16Normal(text: "Add Patients", fontWeight: FontWeight.w400),
      SizedBox(height: 10),

      Consumer<PatientCountProvider>(
        builder: (context, count, child) {
          int rowIndex = 0; // male
          count.initRow(rowIndex);

          return Row(
            children: [
              // Wrapped with Container to look like a text field
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(8.52),
                    color: Colors.grey.shade50,
                  ),
                  child: Text16Normal(
                    text: "Male",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                onPressed: () => count.decrement(rowIndex),
                icon: Icon(Icons.remove),
              ),
              Container(
                width: 40, // fixed width for count text
                alignment: Alignment.center,
                child: Text(
                  count.getCount(rowIndex).toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () => count.increment(rowIndex),
                icon: Icon(Icons.add),
              ),
            ],
          );
        },
      ),

      SizedBox(height: 10),

      Consumer<PatientCountProvider>(
        builder: (context, count, child) {
          int rowIndex = 1; // female
          count.initRow(rowIndex);

          return Row(
            children: [
              // Wrapped with Container to look like a text field
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(8.52),
                    color: Colors.grey.shade50,
                  ),
                  child: Text16Normal(
                    text: "Female",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                onPressed: () => count.decrement(rowIndex),
                icon: Icon(Icons.remove),
              ),
              Container(
                width: 40,
                alignment: Alignment.center,
                child: Text(
                  count.getCount(rowIndex).toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () => count.increment(rowIndex),
                icon: Icon(Icons.add),
              ),
            ],
          );
        },
      ),
    ],
  );
}
