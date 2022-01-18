import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/home_page.dart';
import 'package:shift_calendar/ui/onboarding/ui/onboarding.dart';

abstract class MainNavigationRoutes{

  static const String home = '/';
  static const String onboarding = '/onboarding';
}
final routes = {
  MainNavigationRoutes.home: (BuildContext context) => HomePage(),
  MainNavigationRoutes.onboarding: (BuildContext context) => const OnboardingScreen(),
};