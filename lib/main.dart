import 'package:amrita_treatment/application/auth/sign_in_provider.dart';
import 'package:amrita_treatment/application/patient%20list/patient_list_provider.dart';
import 'package:amrita_treatment/application/register%20patient/branchlist_provider.dart';
import 'package:amrita_treatment/application/register%20patient/form_dropdown_select.dart';
import 'package:amrita_treatment/application/register%20patient/patient_counter_provider.dart';
import 'package:amrita_treatment/application/register%20patient/patient_registration_provider.dart';
import 'package:amrita_treatment/application/register%20patient/payment_option_provider.dart';
import 'package:amrita_treatment/application/register%20patient/treatmentlist_provider.dart';
import 'package:amrita_treatment/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => PatientListProvider()),
        ChangeNotifierProvider(create: (_) => FormDropdownProvider()),
        ChangeNotifierProvider(create: (_) => TreatmentlistProvider()),
        ChangeNotifierProvider(create: (_) => BranchlistProvider()),
        ChangeNotifierProvider(create: (_) => PatientCountProvider()),
        ChangeNotifierProvider(create: (_) => PaymentOptionProvider()),
        ChangeNotifierProvider(create: (_) => PatientRegistrationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amrita Ayurveda',
      onGenerateRoute: (settings) => AppRoutes.generalRouteSettings(settings),
      navigatorKey: navKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
    );
  }
}
