import 'package:amrita_ayurveda/application/patient%20list/patient_list_provider.dart';
import 'package:amrita_ayurveda/core/app_colors.dart';
import 'package:amrita_ayurveda/presentation/patient%20list/widgets/patient_name_date.dart';
import 'package:amrita_ayurveda/widgets/common/app_bar.dart';
import 'package:amrita_ayurveda/widgets/common/app_button.dart';
import 'package:amrita_ayurveda/widgets/common/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2)); // 2-second delay

      final provider = Provider.of<PatientListProvider>(context, listen: false);
      provider.patientList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PatientListProvider>(context, listen: false);

    return Scaffold(
      appBar: buildAppbar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await provider.patientList();
        },
        child: Column(
          children: [
            Consumer<PatientListProvider>(
              builder: (context, patientlist, child) {
                if (patientlist.isLoading) {
                  return Expanded(
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (patientlist.error != null) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await provider.patientList();
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.people_outline, // or any icon you like
                              size: 80,
                              color: Colors.grey.shade400,
                            ),
                            SizedBox(height: 16),
                            Text(
                              "No patients found",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                if (patientlist.patientlist == null ||
                    patientlist.patientlist!.patient!.isEmpty) {
                  return const Center(child: Text("No patients found"));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: patientlist.patientlist!.patient!.length,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      final patient = patientlist.patientlist!.patient![index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.boxcolor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text18Normal(
                                  text: "${index + 1}.",
                                  color: AppColors.secondaryTextElement,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text18Normal(
                                      text: patient.name,
                                      color: AppColors.secondaryTextElement,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(height: 5),
                                    if (patient.patientdetailsSet != null &&
                                        patient.patientdetailsSet!.length >
                                            index)
                                      Text16Normal(
                                        text: patient
                                            .patientdetailsSet![index]
                                            .treatmentName,
                                        color: AppColors.buttoncolor,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        patientnamedate(
                                          icon: Icons.calendar_today_outlined,
                                          text: patient.updatedAt != null
                                              ? "${patient.updatedAt!.year.toString().padLeft(4, '0')} - "
                                                    "${patient.updatedAt!.month.toString().padLeft(2, '0')} - "
                                                    "${patient.updatedAt!.day.toString().padLeft(2, '0')}"
                                              : "",
                                        ),
                                        SizedBox(width: 20),
                                        patientnamedate(
                                          icon: Icons.people_outlined,
                                          text: patient.user ?? "",
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text16Normal(
                                  text: "View Bookings details",
                                  fontWeight: FontWeight.w300,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 18,
                                  color: AppColors.buttoncolor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            LoginButton(buttonName: "Register Now"),
          ],
        ),
      ),
    );
  }
}
