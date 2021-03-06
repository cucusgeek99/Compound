import 'package:compound/src/app/services/analytics_service.dart';
import 'package:flutter/material.dart';
import 'package:compound/src/app/locator/locator.dart';
import 'package:compound/src/app/router/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Register all the models and services before the app starts
  setupLocator();

  // Runs the app :)
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compound',
      theme: ThemeData(
        fontFamily: 'Open Sans',
      ),
      initialRoute: Routes.startupView,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      navigatorObservers: [
        locator<AnalyticsService>().getAnalyticsObserver(),
      ],
    );
  }
}
