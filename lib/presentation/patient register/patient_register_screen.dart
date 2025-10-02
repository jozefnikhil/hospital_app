import 'package:amrita_treatment/application/register%20patient/branchlist_provider.dart';
import 'package:amrita_treatment/application/register%20patient/form_dropdown_select.dart';
import 'package:amrita_treatment/application/register%20patient/patient_counter_provider.dart';
import 'package:amrita_treatment/application/register%20patient/patient_registration_provider.dart';
import 'package:amrita_treatment/application/register%20patient/payment_option_provider.dart';
import 'package:amrita_treatment/application/register%20patient/treatmentlist_provider.dart';
import 'package:amrita_treatment/core/app_colors.dart';
import 'package:amrita_treatment/presentation/patient%20register/widgets/add_patient.dart';
import 'package:amrita_treatment/presentation/patient%20register/widgets/date_time.dart';
import 'package:amrita_treatment/presentation/patient%20register/widgets/payment_options.dart';
import 'package:amrita_treatment/presentation/patient%20register/widgets/print_pdf.dart';
import 'package:amrita_treatment/widgets/common/app_bar.dart';
import 'package:amrita_treatment/widgets/common/app_button.dart';
import 'package:amrita_treatment/widgets/common/app_text.dart';
import 'package:amrita_treatment/widgets/common/app_textfield.dart';
import 'package:amrita_treatment/widgets/common/notification_badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientRegisterScreen extends StatefulWidget {
  const PatientRegisterScreen({super.key});

  @override
  State<PatientRegisterScreen> createState() => _PatientRegisterScreenState();
}

class _PatientRegisterScreenState extends State<PatientRegisterScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<BranchlistProvider>().getbranchlist();
      context.read<TreatmentlistProvider>().gettreatmentlist();
    });

    // Auto-calculate balance when amounts change
    totalAmountController.addListener(_calculateBalance);
    discountController.addListener(_calculateBalance);
    advanceController.addListener(_calculateBalance);
  }

  void _calculateBalance() {
    final total = double.tryParse(totalAmountController.text) ?? 0;
    final discount = double.tryParse(discountController.text) ?? 0;
    final advance = double.tryParse(advanceController.text) ?? 0;

    final balance = total - discount - advance;
    balanceController.text = balance > 0 ? balance.toString() : "0";
  }

  void _clearForm() {
    nameController.clear();
    addressController.clear();
    phoneController.clear();
    totalAmountController.clear();
    discountController.clear();
    advanceController.clear();
    balanceController.clear();
    dateController.clear();
    timeController.clear();

    // context.read<FormDropdownProvider>().clearSelections();
    // context.read<PatientCountProvider>().reset();
    // context.read<PaymentOptionProvider>().clearSelection();
  }

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    totalAmountController.dispose();
    discountController.dispose();
    advanceController.dispose();
    balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.buttontextcolor,
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: text24Normal(
                    text: "Register",
                    fontweight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      apptextfield(
                        title: "Name",
                        hinttext: "Enter your full name",
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      apptextfield(
                        title: "Address",
                        hinttext: "Enter your full address",
                        controller: addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Address is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      apptextfield(
                        title: "Phone",
                        type: TextInputType.number,
                        controller: phoneController,
                        hinttext: "Enter your phone number",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone is required";
                          }
                          if (value.length != 10) {
                            return "Phone must be 10 digits";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Consumer<FormDropdownProvider>(
                        builder: (context, location, child) {
                          return appdropdownfield(
                            title: "Location",
                            items: ["Calicut", "Kannur", "Malappuram"],
                            hinttext: "Choose your location",
                            value: location.selectedCity,
                            onchange: location.setCity,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Location not selected";
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Consumer<BranchlistProvider>(
                        builder: (context, branchlist, child) {
                          return Consumer<FormDropdownProvider>(
                            builder: (context, branch, child) {
                              return appdropdownfield(
                                title: "Branch",
                                items: (branchlist.branchlist?.branches ?? [])
                                    .map(
                                      (t) => {
                                        "id": t.id.toString(),
                                        "name": t.name ?? "Unknown",
                                      },
                                    )
                                    .toList(),
                                hinttext: "Select Branch",
                                value: branch.selectedBranch,
                                onchange: branch.setbranch,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Branch not selected";
                                  }
                                  return null;
                                },
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Consumer<TreatmentlistProvider>(
                        builder: (context, treatments, child) {
                          return Consumer<FormDropdownProvider>(
                            builder: (context, treatment, child) {
                              return appdropdownfield(
                                title: "Treatment",
                                items:
                                    (treatments.treatmentlist?.treatments ?? [])
                                        .map(
                                          (t) => {
                                            "id": t.id.toString(),
                                            "name": t.name ?? "Unknown",
                                          },
                                        )
                                        .toList(),
                                hinttext: "Choose patient treatment",
                                value: treatment.selectedtreatment,
                                onchange: treatment.settreatmentValue,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Treatment not selected";
                                  }
                                  return null;
                                },
                              );
                            },
                          );
                        },
                      ),
                      addPatientWidget(),
                      SizedBox(height: 20),
                      apptextfield(
                        title: "Total Amount",
                        controller: totalAmountController,
                        type: TextInputType.number,
                        hinttext: "Enter total amount",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Total amount is required";
                          }
                          if (double.tryParse(value) == null) {
                            return "Enter valid amount";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      apptextfield(
                        title: "Discount Amount",
                        controller: discountController,
                        type: TextInputType.number,
                        hinttext: "Enter discount amount",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Discount amount is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      buildPaymentOptions(context),
                      SizedBox(height: 20),
                      apptextfield(
                        title: "Advance Amount",
                        type: TextInputType.number,
                        controller: advanceController,
                        hinttext: "Enter advance amount",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Advance amount is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      apptextfield(
                        title: "Balance Amount",
                        controller: balanceController,
                        type: TextInputType.number,
                        hinttext: "Calculated automatically",
                        readonly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Balance amount is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      apptextfield(
                        title: "Treatment Date",
                        hinttext: "Add Date",
                        icon: Icons.calendar_today_outlined,
                        readonly: true,
                        controller: dateController,
                        func: () => pickDate(context, dateController),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Date not selected";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      apptextfield(
                        title: "Treatment Time",
                        hinttext: "Add Time",
                        icon: Icons.timer_outlined,
                        readonly: true,
                        controller: timeController,
                        func: () => pickTime(context, timeController),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Time not selected";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Consumer<PatientRegistrationProvider>(
                        builder: (context, provider, child) {
                          if (provider.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return LoginButton(
                            buttonName: "Save",
                            func: () async {
                              if (_formKey.currentState!.validate()) {
                                // Validate patient count
                                final patientCountProvider = context
                                    .read<PatientCountProvider>();

                                if (patientCountProvider.maleCount == 0 &&
                                    patientCountProvider.femaleCount == 0) {
                                  showErrorBadge(
                                    context,
                                    "Please add at least one patient",
                                  );
                                }

                                // Get IDs (not names)
                                final formProvider = context
                                    .read<FormDropdownProvider>();
                                final branchId = formProvider.selectedBranch;
                                final treatmentId =
                                    formProvider.selectedtreatment;
                                final paymentOption = context
                                    .read<PaymentOptionProvider>()
                                    .selectedPaymentOption;

                                // Validate payment option
                                if (paymentOption.isEmpty) {
                                  showErrorBadge(
                                    context,
                                    "Please select payment option",
                                  );
                                }

                                // Call registration
                                await context
                                    .read<PatientRegistrationProvider>()
                                    .registerPatient(
                                      name: nameController.text,
                                      payment: paymentOption,
                                      phone: phoneController.text,
                                      address: addressController.text,
                                      totalamount:
                                          double.tryParse(
                                            totalAmountController.text,
                                          ) ??
                                          0,
                                      disamount:
                                          double.tryParse(
                                            discountController.text,
                                          ) ??
                                          0,
                                      advamount:
                                          double.tryParse(
                                            advanceController.text,
                                          ) ??
                                          0,
                                      balamount:
                                          double.tryParse(
                                            balanceController.text,
                                          ) ??
                                          0,
                                      datntime:
                                          "${dateController.text}-${timeController.text}",
                                      male: patientCountProvider.maleCountStr,
                                      female:
                                          patientCountProvider.femaleCountStr,
                                      branch: branchId.toString(),
                                      treatment: treatmentId.toString(),
                                    );

                                // Check result and show feedback
                                if (!context.mounted) return;

                                final registrationProvider = context
                                    .read<PatientRegistrationProvider>();

                                if (registrationProvider.isSuccess) {
                                  showSuccessBadge(
                                    context,
                                    "Patient registered successfully!",
                                  );
                                  final treatmentProvider = context
                                      .read<TreatmentlistProvider>();
                                  String treatmentName = "Unknown Treatment";

                                  final treatments = treatmentProvider
                                      .treatmentlist
                                      ?.treatments;
                                  if (treatments != null &&
                                      treatments.isNotEmpty) {
                                    try {
                                      final treatment = treatments.firstWhere(
                                        (t) => t.id.toString() == treatmentId,
                                      );
                                      treatmentName =
                                          treatment.name ?? "Unknown Treatment";
                                    } catch (e) {
                                      // Treatment not found, use default
                                      treatmentName = "Unknown Treatment";
                                    }
                                  }
                                  // STORE VALUES BEFORE CLEARING
                                  final patientName = nameController.text;
                                  final patientAddress = addressController.text;
                                  final patientPhone = phoneController.text;
                                  final patientDate = dateController.text;
                                  final patientTime = timeController.text;
                                  final patientTotal =
                                      double.tryParse(
                                        totalAmountController.text,
                                      ) ??
                                      0;
                                  final patientDiscount =
                                      double.tryParse(
                                        discountController.text,
                                      ) ??
                                      0;
                                  final patientAdvance =
                                      double.tryParse(advanceController.text) ??
                                      0;
                                  final patientBalance =
                                      double.tryParse(balanceController.text) ??
                                      0;
                                  final maleCount =
                                      patientCountProvider.maleCount;
                                  final femaleCount =
                                      patientCountProvider.femaleCount;

                                  // NOW clear the form
                                  _clearForm();

                                  final patients = [
                                    {"male": maleCount, "female": femaleCount},
                                  ];

                                  // Generate PDF with stored values
                                  generatePdf(
                                    context,
                                    name: patientName,
                                    address: patientAddress,
                                    phone: patientPhone,
                                    dateNdTime:
                                        patientDate, // Pass date separately
                                    treatmenttime:
                                        patientTime, // Pass time separately
                                    treatmentId: treatmentName,
                                    totalAmount: patientTotal,
                                    discountAmount: patientDiscount,
                                    advanceAmount: patientAdvance,
                                    balanceAmount: patientBalance,
                                    patients: patients,
                                  );
                                } else if (registrationProvider.error != null) {
                                  showErrorBadge(
                                    context,
                                    "Unable to Register Patient",
                                  );
                                }
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
