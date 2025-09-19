import 'dart:developer';

import 'package:amrita_ayurveda/application/auth/sign_in_provider.dart';
import 'package:amrita_ayurveda/presentation/auth/sign_in/widgets/widgets.dart';
import 'package:amrita_ayurveda/routes/routes_names.dart';
import 'package:amrita_ayurveda/widgets/common/app_button.dart';
import 'package:amrita_ayurveda/widgets/common/app_text.dart';
import 'package:amrita_ayurveda/widgets/common/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(
      builder: (context, signinProvider, child) {
        // Check token and redirect
        if (signinProvider.user?.token != null) {
          log('hello');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              ApprouteNames.patientlist,
              (route) => false,
            );
          });
        }

        return Material(
          child: SafeArea(
            top: false,
            child: SizedBox(
              child: Column(
                children: [
                  Logintopcontainer(),
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 50),
                              text24Normal(
                                text:
                                    "Login Or Register To Book Your Appointments",
                                fontweight: FontWeight.w600,
                                textalign: TextAlign.start,
                              ),
                              SizedBox(height: 20),
                              apptextfield(
                                title: "Email",
                                hinttext: "Enter your email",
                                controller: emailController,
                              ),
                              SizedBox(height: 20),
                              apptextfield(
                                title: "Password",
                                hinttext: "Enter password",
                                controller: passwordController,
                              ),
                              SizedBox(height: 60),
                              LoginButton(
                                buttonName: "Login",
                                isLoading: signinProvider.isLoading,
                                func: () {
                                  if (emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty) {
                                    signinProvider.login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 80),
                              bottomtext(),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
