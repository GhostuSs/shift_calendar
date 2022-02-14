import 'package:shift_calendar/data/template_data.dart';

import '../ui/res/colors/colors.dart';

class Templates {
  List<TemplateData>? templates = [
    TemplateData(
        date: DateTime(2022, 2, 23, 00, 00),
        startTime: const Duration(hours: 17, minutes: 30),
        endTime: const Duration(hours: 21, minutes: 30),
        name: 'Training',
        note: 'Cardio training',
        color: ProjectColors.coralRed,
        iconIndex: 6),
    TemplateData(
        date: DateTime(2022, 2, 23, 00, 00),
        startTime: const Duration(hours: 16, minutes: 30),
        endTime: const Duration(hours: 20, minutes: 30),
        name: 'KLM',
        note: 'Flight',
        color: ProjectColors.amber,
        iconIndex: 4),
    TemplateData(
        date: DateTime(2022, 2, 23, 00, 00),
        startTime: const Duration(hours: 17, minutes: 30),
        endTime: const Duration(hours: 21, minutes: 30),
        name: 'Build',
        note: 'App',
        color: ProjectColors.lightGreen,
        iconIndex: 2),
    TemplateData(
        date: DateTime(2022, 2, 23, 00, 00),
        startTime: const Duration(hours: 17, minutes: 30),
        endTime: const Duration(hours: 21, minutes: 30),
        name: 'Training',
        note: 'Cardio training',
        color: ProjectColors.darkGreen,
        iconIndex: 8),
    TemplateData(
        date: DateTime(2022, 2, 23, 00, 00),
        startTime: const Duration(hours: 17, minutes: 30),
        endTime: const Duration(hours: 21, minutes: 30),
        name: 'Train',
        note: 'nope',
        color: ProjectColors.lightBlue,
        iconIndex: 9),
    TemplateData(
        date: DateTime(2022, 2, 7, 00, 00),
        startTime: const Duration(hours: 10, minutes: 00),
        endTime: const Duration(hours: 20, minutes: 10),
        name: 'Conference',
        note: 'In Sochi',
        color: ProjectColors.lightGreen,
        iconIndex: 8),
    TemplateData(
        date: DateTime(2022, 3, 8, 00, 00),
        startTime: const Duration(hours: 00, minutes: 30),
        endTime: const Duration(hours: 11, minutes: 0),
        name: '8 March',
        note: 'Send flowers',
        allDay: true,
        notifications: true,
        color: ProjectColors.coralRed,
        iconIndex: 7),
  ];
}
