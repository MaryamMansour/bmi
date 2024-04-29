import 'package:flutter/material.dart';

import 'bmi_app.dart';
import 'core/routing/app_router.dart';

void main() {
  runApp(BmiApp(
    appRouter: AppRouter(),
  ));
}
