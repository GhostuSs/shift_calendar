import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/screens/calendar/ui/calendar_screen.dart';
import 'package:shift_calendar/ui/screens/home_page.dart';
import 'package:shift_calendar/ui/screens/onboarding/ui/onboarding_screen.dart';
import 'package:shift_calendar/ui/screens/settings/ui/settings_screen.dart';
import 'package:shift_calendar/ui/screens/templates/ui/templates_screen.dart';

abstract class MainNavigationRoutes {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String settings = '/settings';
  static const String templates = '/templates';
  static const String calendar = '/calendar';
}

final routes = {
  MainNavigationRoutes.home: (BuildContext context) => const HomePage(),
  MainNavigationRoutes.onboarding: (BuildContext context) =>
      const OnBoardingScreen(),
  MainNavigationRoutes.settings: (BuildContext context) =>
      const SettingsScreen(),
  MainNavigationRoutes.templates: (BuildContext context) =>
      const TemplatesScreen(),
  MainNavigationRoutes.calendar: (BuildContext context) =>
      const CalendarScreen(),
};
