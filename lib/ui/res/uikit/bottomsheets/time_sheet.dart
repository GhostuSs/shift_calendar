import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

class TimeBtmSheet extends StatefulWidget {
  final String label;

  const TimeBtmSheet({Key? key, required this.label}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TimeBtmSheetState();
  }
}

class _TimeBtmSheetState extends State<TimeBtmSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                widget.label,
                style: AppTypography.regular18Black,
              ),
            ),
            CupertinoTimerPicker(onTimerDurationChanged: (time) => print(time))
          ],
        ),
      ),
    );
  }
}
