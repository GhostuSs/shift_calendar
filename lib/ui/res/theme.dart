import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'colors/colors.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    backgroundColor: ProjectColors.white,
    scaffoldBackgroundColor: ProjectColors.white,
    inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: ProjectColors.darkGray)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: ProjectColors.backgroundGray)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: ProjectColors.backgroundGray)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: ProjectColors.backgroundGray))),
  );
  static CalendarStyle calendarStyle = CalendarStyle(
      markerDecoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(2)),
      cellAlignment: Alignment.topCenter,
      markerMargin: EdgeInsets.zero,
      cellMargin: EdgeInsets.zero,
      cellPadding: const EdgeInsets.only(top: 10),
      canMarkersOverflow: true,
      disabledTextStyle:
          const TextStyle(color: ProjectColors.black, fontSize: 17.0),
      selectedTextStyle:
          const TextStyle(color: ProjectColors.white, fontSize: 17.0),
      defaultTextStyle:
          const TextStyle(color: ProjectColors.black, fontSize: 17.0),
      outsideTextStyle:
          const TextStyle(color: ProjectColors.black, fontSize: 17.0),
      rowDecoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: ProjectColors.backgroundGray))),
      weekendDecoration: const BoxDecoration(
          shape: BoxShape.rectangle, color: ProjectColors.lightGray),
      todayDecoration: const BoxDecoration(
          shape: BoxShape.rectangle, color: ProjectColors.black),
      selectedDecoration: const BoxDecoration(
          shape: BoxShape.rectangle, color: ProjectColors.black));
}
