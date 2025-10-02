import 'package:amrita_treatment/core/images_res.dart';
import 'package:flutter/material.dart';

class Logintopcontainer extends StatelessWidget {
  const Logintopcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 217,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesRes.loginimage),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: Image.asset(ImagesRes.logo)),
    );
  }
}
