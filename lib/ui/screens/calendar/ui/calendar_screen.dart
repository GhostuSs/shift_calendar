import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';

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
        title: 'Calendar',
      ),
      backgroundColor: ProjectColors.white,
      body: Column(
        children: const [
          Text(
            'soon',
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
