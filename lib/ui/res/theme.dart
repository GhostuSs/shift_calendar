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
            borderSide: BorderSide(color: ProjectColors.backgroundGray)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: ProjectColors.backgroundGray)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: ProjectColors.backgroundGray))),
  );
  static CalendarStyle calendarStyle = const CalendarStyle(
      cellAlignment: Alignment.topCenter,
      markerMargin: EdgeInsets.zero,
      cellMargin: EdgeInsets.zero,
      cellPadding: EdgeInsets.only(top: 10),
      canMarkersOverflow: true,
      disabledTextStyle: TextStyle(color: ProjectColors.black, fontSize: 17.0),
      selectedTextStyle: TextStyle(color: ProjectColors.white, fontSize: 17.0),
      defaultTextStyle: TextStyle(color: ProjectColors.black, fontSize: 17.0),
      outsideTextStyle: TextStyle(color: ProjectColors.black, fontSize: 17.0),
      rowDecoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: ProjectColors.backgroundGray))),
      weekendDecoration: BoxDecoration(
          shape: BoxShape.rectangle, color: ProjectColors.lightGray),
      todayDecoration:
          BoxDecoration(shape: BoxShape.rectangle, color: ProjectColors.black),
      selectedDecoration:
          BoxDecoration(shape: BoxShape.rectangle, color: ProjectColors.black));
}
