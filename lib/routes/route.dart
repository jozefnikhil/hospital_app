import 'dart:developer';

import 'package:amrita_treatment/presentation/auth/sign_in/screen_login.dart';
import 'package:amrita_treatment/presentation/auth/splash_screen.dart';
import 'package:amrita_treatment/presentation/patient%20list/patientlist_screen.dart';
import 'package:amrita_treatment/presentation/patient%20register/patient_register_screen.dart';
import 'package:amrita_treatment/routes/routes_names.dart';
import 'package:flutter/material.dart';

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.page, required this.path});
}

class AppRoutes {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(page: SplashScreen(), path: ApprouteNames.splashscreen),
      RouteEntity(page: ScreenLogin(), path: ApprouteNames.login),
      RouteEntity(page: PatientListScreen(), path: ApprouteNames.patientlist),
      RouteEntity(
        page: PatientRegisterScreen(),
        path: ApprouteNames.registerpatient,
      ),
    ];
  }

  static MaterialPageRoute generalRouteSettings(RouteSettings settings) {
    log('my route name is ${settings.name}');

    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
        // }
      }
    }

    return MaterialPageRoute(
      builder: (_) => SplashScreen(),
      settings: settings,
    );
  }
}
