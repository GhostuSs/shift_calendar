import 'package:flutter/material.dart';

import 'colors/colors.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    backgroundColor: ProjectColors.white,
    scaffoldBackgroundColor: ProjectColors.white,
    inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: ProjectColors.lightGray)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: ProjectColors.darkGray)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: ProjectColors.darkGray)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: ProjectColors.darkGray))),
  );
}
