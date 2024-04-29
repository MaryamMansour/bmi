import 'package:bmi/core/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/ui/pages/login.dart';
import '../../features/home/ui/home.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => SignIn());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("NO Route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
