import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';
import 'package:shift_calendar/ui/screens/calendar/ui/descriptionDayScreen.dart';
import 'package:table_calendar/table_calendar.dart';

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

//TODO: Доделать
class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
      ),
      backgroundColor: ProjectColors.white,
      body: Column(
        children: [
          Container(
            color: ProjectColors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        '1231231312312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313',
                        style: TextStyle(
                            color: ProjectColors.white,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  child: const Text(
                    'give a receipt',
                    style: TextStyle(color: ProjectColors.black, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TableCalendar(
              currentDay: selectedDay,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  print(selectDay);
                  selectedDay = selectDay;
                });
              },
              calendarStyle: AppTheme.calendarStyle,
              headerVisible: false,
              startingDayOfWeek: StartingDayOfWeek.monday,
              rowHeight: 88,
              focusedDay: selectedDay,
              daysOfWeekHeight: 30,
              firstDay: DateTime(DateTime.now().year - 1),
              lastDay: DateTime(DateTime.now().year + 1),
              eventLoader: (DateTime date) {
                return [DateTime.now()];
              },
            ),
          ),
          const Spacer(),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int index = 0;
                    index < context.read<Templates>().templates!.length;
                    index++)
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: RawIcon(
                      size: 30,
                      data: context.read<Templates>().templates![index],
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
}
