import 'package:amrita_ayurveda/core/images_res.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesRes.splashscreen),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
