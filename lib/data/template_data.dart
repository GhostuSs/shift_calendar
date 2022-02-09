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

  void init(TemplateData? data) {
    this.name = data?.name ?? '';
    this.note = data?.note ?? '';
    this.iconIndex = data?.iconIndex ?? 0;
    this.color = data?.color ?? ProjectColors.lightBlue;
    this.startTime = data?.startTime ?? Duration(hours: 0, seconds: 0);
    this.endTime = data?.endTime ?? Duration(hours: 0, seconds: 0);
    this.allDay = data?.allDay ?? false;
    this.notifications = data?.notifications ?? false;
  }
}
