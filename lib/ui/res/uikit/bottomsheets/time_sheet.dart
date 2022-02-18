import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/data/template_data.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../../../data/screen_resolution.dart';

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
  int _selectedHour = 0, _selectedMinute = 0;
  int _amPm = 0;

  @override
  void initState() {
    widget.templateData.startTime ??= const Duration(hours: 0, minutes: 0);
    widget.templateData.endTime ??= const Duration(hours: 0, minutes: 0);
    widget.typeOfTime == TypeOfTime.start
        ? _selectedHour = widget.templateData.startTime!.inHours % 12
        : _selectedHour = widget.templateData.endTime!.inHours % 12;
    widget.typeOfTime == TypeOfTime.start
        ? _selectedMinute = widget.templateData.startTime!.inMinutes % 60
        : _selectedHour = widget.templateData.endTime!.inMinutes % 60;
    _amPm = widget.templateData.amPm ?? 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Resolution size = context.read<Resolution>();
    return Padding(
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
          Container(
            height: size.height! * 0.3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: CupertinoPicker(
                      looping: true,
                      scrollController: new FixedExtentScrollController(
                        initialItem: _selectedHour,
                      ),
                      itemExtent: 35.0,
                      backgroundColor: Colors.white,
                      onSelectedItemChanged: (int index) {
                        _selectedHour = index;
                        widget.typeOfTime == TypeOfTime.start
                            ? widget.templateData.startTime = Duration(
                                hours: _selectedHour, minutes: _selectedMinute)
                            : widget.templateData.startTime = Duration(
                                hours: _selectedHour, minutes: _selectedMinute);
                        widget.notifyParent();
                      },
                      children: List<Widget>.generate(12, (int index) {
                        return Center(
                          child: Text('${index}'),
                        );
                      })),
                ),
                Expanded(
                  child: CupertinoPicker(
                      looping: true,
                      scrollController: FixedExtentScrollController(
                        initialItem: _selectedMinute,
                      ),
                      itemExtent: 35.0,
                      backgroundColor: Colors.white,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          _selectedMinute = index;
                          widget.typeOfTime == TypeOfTime.start
                              ? widget.templateData.startTime = Duration(
                                  hours: _selectedHour,
                                  minutes: _selectedMinute)
                              : widget.templateData.startTime = Duration(
                                  hours: _selectedHour,
                                  minutes: _selectedMinute);
                          widget.notifyParent();
                        });
                      },
                      children: new List<Widget>.generate(61, (int index) {
                        return new Center(
                          child: new Text('${index}'),
                        );
                      })),
                ),
                Expanded(
                  child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: _amPm,
                      ),
                      itemExtent: 35.0,
                      backgroundColor: Colors.white,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          _amPm = index;
                        });
                      },
                      children: List<Widget>.generate(2, (int index) {
                        return Center(
                          child:
                              index == 0 ? const Text('AM') : const Text('PM'),
                        );
                      })),
                ),
              ],
            ),
          )
          /* MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: CupertinoTimerPicker(
                initialTimerDuration: widget.typeOfTime == TypeOfTime.start
                    ? widget.templateData.startTime!
                    : widget.templateData.endTime!,
                mode: CupertinoTimerPickerMode.hm,
                onTimerDurationChanged: (time) {
                  widget.typeOfTime == TypeOfTime.start
                      ? widget.templateData.startTime = time
                      : widget.templateData.endTime = time;
                  widget.notifyParent();
                }),
          )*/
        ],
      ),
    );
  }
}
