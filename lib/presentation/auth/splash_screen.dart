import 'package:amrita_treatment/core/images_res.dart';
import 'package:amrita_treatment/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Replace with your target screen (example: LoginScreen)
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(ApprouteNames.login, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesRes.splashscreen),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
