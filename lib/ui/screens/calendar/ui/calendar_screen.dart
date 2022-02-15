import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';
import 'package:shift_calendar/ui/screens/calendar/ui/description_of_day_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../data/screen_resolution.dart';
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

  @override
  Widget build(BuildContext context) {
    final size = context.read<Resolution>();
    final Templates prov = context.read<Templates>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ProjectColors.black,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DayTemplates(day: selectedDay)));
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
                    ),
                    Expanded(
                      child: Text(
                        prov.templates
                                    ?.where((element) =>
                                        element.date?.day == selectedDay.day &&
                                        element.date?.month ==
                                            selectedDay.month)
                                    .isNotEmpty ==
                                true
                            ? '(${prov.templates?.firstWhere((element) => element.date?.day == selectedDay.day && element.date?.month == selectedDay.month).name} / ${prov.templates!.firstWhere((element) => element.date?.day == selectedDay.day && element.date?.month == selectedDay.month).allDay == true ? 'All day' : '${formatTime(prov.templates?.firstWhere((element) => element.date?.day == selectedDay.day && element.date?.month == selectedDay.month).startTime ?? const Duration(hours: 0, minutes: 0))} - ${formatTime(prov.templates?.firstWhere((element) => element.date?.day == selectedDay.day && element.date?.month == selectedDay.month).endTime ?? const Duration(hours: 0, minutes: 0))}'})'
                            : '',
                        style: const TextStyle(
                            color: ProjectColors.white,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height! * 0.01,
                        horizontal: size.height! * 0.02),
                    child: prov.templates!
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
                          text: prov.templates!
                              .where((element) =>
                          element.date?.day ==
                              selectedDay.day &&
                              element.date?.month ==
                                  selectedDay.month)
                              .isNotEmpty ==
                              true
                              ? prov.templates!
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
                for (int i = 0; i < prov.templates!.length; i++) {
                  if (!dates.contains(prov.templates![i].date) &&
                      date.day == prov.templates![i].date?.day &&
                      date.month == prov.templates![i].date?.month) {
                    dates.add(prov.templates![i].date!);
                  }
                }
                return dates;
              },
            ),
          ),
          const Spacer(),
          Container(
            height: size.height! * 0.09,
            padding: EdgeInsets.only(
                bottom: size.height! * 0.01,
                left: size.height! * 0.01,
                right: size.height! * 0.01),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int index = 0; index < prov.templates!.length; index++)
                  Padding(
                    padding: EdgeInsets.only(left: size.height! * 0.008),
                    child: RawIcon(
                      size: size.height! * 0.035,
                      data: prov.templates![index],
                    ),
                  )
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

  String formatTime(Duration time) {
    String retData = '';
    retData = time.inHours < 10 ? '0${time.inHours}' : '${time.inHours}';
    retData = time.inMinutes % 60 < 10
        ? retData + ':0${time.inMinutes % 60}'
        : retData + ':${time.inMinutes % 60}';
    return retData;
  }
}
