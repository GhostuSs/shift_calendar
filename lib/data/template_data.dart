import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';

class TemplateData {
  String? name;
  String? note;
  int? iconIndex;
  Color? color;
  Duration? startTime;
  Duration? endTime;
  bool? allDay;
  bool? notifications;

  void init() {
    this.name = '';
    this.note = '';
    this.iconIndex = 0;
    this.color = ProjectColors.lightBlue;
    this.startTime = Duration(hours: 0, seconds: 0);
    this.endTime = Duration(hours: 0, seconds: 0);
    this.allDay = false;
    this.notifications = false;
  }
}
