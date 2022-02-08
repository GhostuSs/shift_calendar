import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/data/template_data.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

enum TypeOfTime { start, finish }

class TimeBtmSheet extends StatefulWidget {
  final TypeOfTime typeOfTime;
  final void Function() notifyParent;

  const TimeBtmSheet(
      {Key? key, required this.notifyParent, required this.typeOfTime})
      : super(key: key);

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
                widget.typeOfTime == TypeOfTime.start ? 'Start' : 'Finish',
                style: AppTypography.regular18Black,
              ),
            ),
            CupertinoTimerPicker(
                initialTimerDuration: widget.typeOfTime == TypeOfTime.start
                    ? context.read<TemplateData>().startTime!
                    : context.read<TemplateData>().endTime!,
                mode: CupertinoTimerPickerMode.hm,
                onTimerDurationChanged: (time) {
                  widget.typeOfTime == TypeOfTime.start
                      ? context.read<TemplateData>().startTime = time
                      : context.read<TemplateData>().endTime = time;
                  widget.notifyParent();
                })
          ],
        ),
      ),
    );
  }
}
