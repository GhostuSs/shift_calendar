import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shift_calendar/data/template_data.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

enum TypeOfTime { start, finish }

class TimeBtmSheet extends StatefulWidget {
  final TypeOfTime typeOfTime;
  final TemplateData templateData;
  final void Function() notifyParent;

  const TimeBtmSheet(
      {Key? key,
      required this.notifyParent,
      required this.typeOfTime,
      required this.templateData})
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                    ? widget.templateData.startTime!
                    : widget.templateData.endTime!,
                mode: CupertinoTimerPickerMode.hm,
                onTimerDurationChanged: (time) {
                  widget.typeOfTime == TypeOfTime.start
                      ? widget.templateData.startTime = time
                      : widget.templateData.endTime = time;
                  widget.notifyParent();
                })
          ],
        ),
      ),
    );
  }
}
