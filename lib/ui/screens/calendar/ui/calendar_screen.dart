import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RawAppBar(
        height: MediaQuery.of(context).size.height,
        title: formatDate(),
      ),
      backgroundColor: ProjectColors.white,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TableCalendar(
            currentDay: DateTime.now(),
            calendarStyle: const CalendarStyle(
                markerMargin: EdgeInsets.zero,
                cellMargin: EdgeInsets.zero,
                cellPadding: EdgeInsets.zero,
                canMarkersOverflow: true,
                disabledTextStyle:
                    TextStyle(color: ProjectColors.black, fontSize: 17.0),
                selectedTextStyle:
                    TextStyle(color: ProjectColors.white, fontSize: 17.0),
                defaultTextStyle:
                    TextStyle(color: ProjectColors.black, fontSize: 17.0),
                outsideTextStyle:
                    TextStyle(color: ProjectColors.black, fontSize: 17.0),
                weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: ProjectColors.lightGray),
                todayDecoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: ProjectColors.black),
                selectedDecoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: ProjectColors.black)),
            headerVisible: false,
            startingDayOfWeek: StartingDayOfWeek.monday,
            rowHeight: 88,
            focusedDay: DateTime.now(),
            firstDay: DateTime(2022),
            lastDay: DateTime(2023),
          )
        ],
      ),
    );
  }

  String formatDate() {
    String retData = '';
    retData = DateTime.now().day.toString();
    retData = month(DateTime.now()) + retData;

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
}
