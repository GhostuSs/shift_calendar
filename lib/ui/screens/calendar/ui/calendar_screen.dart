import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';
import 'package:shift_calendar/ui/screens/calendar/ui/description_of_day_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../data/screen_resolution.dart';
import '../../../../data/template_data.dart';
import '../../../../data/templates_data.dart';
import '../../../res/theme.dart';
import '../../../res/uikit/icon/raw_icon.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDay = DateTime.now();
  late Templates data;

  final List<TemplateData> initialData = [
    TemplateData(
        //date: DateTime(2022, 2, 23, 00, 00),
        startTime: const Duration(hours: 17, minutes: 30),
        endTime: const Duration(hours: 21, minutes: 30),
        name: 'Day work shift',
        amPmStart: 0,
        amPmEnd: 1,
        color: ProjectColors.lightBlue,
        iconIndex: 0),
    TemplateData(
        //date: DateTime(2022, 2, 23, 00, 00),
        startTime: const Duration(hours: 16, minutes: 30),
        endTime: const Duration(hours: 20, minutes: 30),
        name: 'Night work shift',
        color: ProjectColors.darkGray,
        iconIndex: 1),
    TemplateData(
       // date: DateTime(2022, 2, 23, 00, 00),
        startTime: const Duration(hours: 17, minutes: 30),
        endTime: const Duration(hours: 21, minutes: 30),
        name: 'Weekend',
        allDay: true,
        color: ProjectColors.orange,
        iconIndex: 2),
    TemplateData(
        //date: DateTime(2022, 2, 23, 00, 00),
        startTime: const Duration(hours: 17, minutes: 30),
        endTime: const Duration(hours: 21, minutes: 30),
        name: 'Salary',
        allDay: true,
        color: ProjectColors.darkGreen,
        iconIndex: 4),
    TemplateData(
        //date: DateTime(2022, 2, 23, 00, 00),
        startTime: const Duration(hours: 17, minutes: 30),
        endTime: const Duration(hours: 21, minutes: 30),
        name: 'Sick leave',
        allDay: true,
        color: ProjectColors.coralRed,
        iconIndex: 3),
    TemplateData(
        //date: DateTime(2022, 2, 7, 00, 00),
        startTime: const Duration(hours: 10, minutes: 00),
        endTime: const Duration(hours: 20, minutes: 10),
        name: 'Important day',
        allDay: true,
        color: ProjectColors.purple,
        iconIndex: 5),
  ];

  @override
  initState() {
    if (context.read<Templates>().templates!.isEmpty == true) {
      context.read<Templates>().templates!.addAll(initialData);
    }
    data = context.read<Templates>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Resolution size = context.read<Resolution>();
    size.set(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ProjectColors.black,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DayTemplates(
                      day: selectedDay, notifyParent: () => setState(() {}))));
        },
        child: const Icon(
          Icons.edit,
          color: ProjectColors.white,
        ),
      ),
      appBar: RawAppBar(
        height: MediaQuery.of(context).size.height,
        title: formatDate(),
        selectedDay: selectedDay,
        appBarType: Type.calendar,
      ),
      backgroundColor: ProjectColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ProjectColors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.height! * 0.02,
                      child: Text(
                        data.templates
                                      ?.where((element) =>
                                          element.date?.day ==
                                              selectedDay.day &&
                                          element.date?.month ==
                                              selectedDay.month)
                                      .isNotEmpty ==
                                  true
                              ? '(${data.templates?.firstWhere((element) => element.date?.day == selectedDay.day && element.date?.month == selectedDay.month).name} / ${data.templates!.firstWhere((element) => element.date?.day == selectedDay.day && element.date?.month == selectedDay.month).allDay == true ? 'All day' : '${formatTime(data.templates?.firstWhere((element) => element.date?.day == selectedDay.day && element.date?.month == selectedDay.month).startTime ?? const Duration(hours: 0, minutes: 0), data.templates?.firstWhere((element) => element.date?.day == selectedDay.day && element.date?.month == selectedDay.month).amPmStart ?? 0)} - ${formatTime(data.templates?.firstWhere((element) => element.date?.day == selectedDay.day && element.date?.month == selectedDay.month).endTime ?? const Duration(hours: 0, minutes: 0), data.templates?.firstWhere((element) => element.date?.day == selectedDay.day && element.date?.month == selectedDay.month).amPmEnd ?? 0)}'})'
                              : '',
                          style: const TextStyle(
                              color: ProjectColors.white,
                              overflow: TextOverflow.ellipsis),
                        )),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height! * 0.01,
                        horizontal: size.height! * 0.02),
                    child: data.templates!
                                .where((element) =>
                                    element.date?.day == selectedDay.day &&
                                    element.date?.month == selectedDay.month)
                                .isNotEmpty ==
                            true
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 5),
                            decoration: BoxDecoration(
                                color: ProjectColors.white,
                                borderRadius: BorderRadius.circular(5)),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: ProjectColors.black,
                              fontFamily: 'sfprodisplay'),
                          text: data.templates!
                                            .where((element) =>
                                                element.date?.day ==
                                                    selectedDay.day &&
                                                element.date?.month ==
                                                    selectedDay.month)
                                            .isNotEmpty ==
                                        true
                                    ? data.templates!
                                        .firstWhere((element) =>
                                            element.date?.day ==
                                                selectedDay.day &&
                                            element.date?.month ==
                                                selectedDay.month)
                                        .note
                                    : '',
                              ),
                            ),
                          )
                        : Container(
                            height: size.height! * 0.025,
                          )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TableCalendar(
              currentDay: selectedDay,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                });
              },
              calendarStyle: AppTheme.calendarStyle,
              headerVisible: false,
              startingDayOfWeek: StartingDayOfWeek.monday,
              rowHeight: size.height! * 0.095,
              focusedDay: selectedDay,
              daysOfWeekHeight: size.height! * 0.025,
              firstDay: DateTime(DateTime.now().year - 1),
              lastDay: DateTime(DateTime.now().year + 1),
              eventLoader: (DateTime date) {
                List<DateTime> dates = List.empty(growable: true);
                for (int i = 0; i < data.templates!.length; i++) {
                  if (!dates.contains(data.templates![i].date) &&
                      date.day == data.templates![i].date?.day &&
                      date.month == data.templates![i].date?.month) {
                    dates.add(data.templates![i].date!);
                  }
                }
                return dates;
              },
            ),
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: ProjectColors.backgroundGray))),
            height: size.height! * 0.09,
            padding: EdgeInsets.only(
                bottom: size.height! * 0.01,
                left: size.height! * 0.01,
                right: size.height! * 0.01),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int index = 0;
                    index < data.templates!.length && index < 6;
                    index++)
                  Padding(
                    padding: EdgeInsets.only(left: size.height! * 0.008),
                    child: RawIcon(
                      size: size.height! * 0.035,
                      data: data.templates![index],
                    ),
                  ),
                data.templates!.length > 5 && data.templates!.length - 6 != 0
                    ? Padding(
                        padding: EdgeInsets.only(left: size.height! * 0.0055),
                        child: Container(
                          width: size.height! * 0.036,
                          height: size.height! * 0.036,
                          child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(size.height! * 0.005),
                                child: Text(
                                  '+${data.templates!.length - 6}',
                                  style: TextStyle(
                                      fontFamily: 'sfprodisplay',
                                      fontSize: size.height! * 0.015,
                                      color: ProjectColors.white),
                                )),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ProjectColors.darkGray),
                        ))
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }

  String formatDate() {
    String retData = '';
    retData = selectedDay.day.toString();
    retData = month(selectedDay) + retData;

    return retData;
  }

  String month(DateTime date) {
    switch (date.month) {
      case 1:
        {
          return 'January ';
        }
      case 2:
        {
          return 'February ';
        }
      case 3:
        {
          return 'March ';
        }
      case 4:
        {
          return 'April ';
        }
      case 5:
        {
          return 'May ';
        }
      case 6:
        {
          return 'June ';
        }
      case 7:
        {
          return 'July ';
        }
      case 8:
        {
          return 'August ';
        }
      case 9:
        {
          return 'September ';
        }
      case 10:
        {
          return 'October ';
        }
      case 11:
        {
          return 'November ';
        }

      case 12:
        {
          return 'December ';
        }
      default:
        {
          return 'Unknown';
        }
    }
  }

  String formatTime(Duration time, int amPm) {
    String retData = '';
    retData =
        time.inHours < 10 ? '0${time.inHours % 12}' : '${time.inHours % 12}';
    retData = time.inMinutes % 60 < 10
        ? retData + ':0${time.inMinutes % 60}'
        : retData + ':${time.inMinutes % 60}';
    retData = amPm == 1 ? retData + ' PM' : retData + ' AM';
    return retData;
  }
}
