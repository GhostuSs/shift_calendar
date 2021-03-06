import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';

class TemplateData {
  TemplateData(
      {this.name,
      this.note,
      this.date,
      this.endTime,
      this.startTime,
      this.notifications,
      this.allDay,
      this.color,
      this.iconIndex,
      this.amPmStart,
      this.amPmEnd});

  String? name;
  String? note;
  int? iconIndex;
  Color? color;
  DateTime? date;
  int? amPmStart;
  int? amPmEnd;
  Duration? startTime;
  Duration? endTime;
  bool? allDay;
  bool? notifications;

  void init(TemplateData? data) {
    this.date = data?.date ?? DateTime.now();
    this.name = data?.name ?? '';
    this.note = data?.note ?? '';
    this.iconIndex = data?.iconIndex ?? 0;
    this.color = data?.color ?? ProjectColors.lightBlue;
    this.startTime = data?.startTime ?? const Duration(hours: 9, minutes: 0);
    this.endTime = data?.endTime ?? const Duration(hours: 0, minutes: 0);
    this.allDay = data?.allDay ?? false;
    this.notifications = data?.notifications ?? false;
  }
}
