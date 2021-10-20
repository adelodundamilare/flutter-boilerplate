import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grigora/constants.dart';
import 'package:grigora/views/login/login_screen.dart';
import 'package:grigora/views/onboarding_screen.dart';

class AppPages {
  AppPages._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kRouteOnboarding:
        return new MyCustomRoute(
          builder: (_) => new LoginScreen(),
          settings: settings,
        );
      default:
        return new MyCustomRoute(
          builder: (_) => new OnboardingScreen(),
          settings: settings,
        );
    }
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
