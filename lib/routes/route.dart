import 'dart:developer';

import 'package:amrita_ayurveda/presentation/auth/sign_in/screen_login.dart';
import 'package:amrita_ayurveda/presentation/auth/splash_screen.dart';
import 'package:amrita_ayurveda/routes/routes_names.dart';
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
