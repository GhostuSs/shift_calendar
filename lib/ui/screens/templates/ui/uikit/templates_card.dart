import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shift_calendar/data/template_data.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';
import 'package:shift_calendar/ui/res/uikit/icon/raw_icon.dart';

import '../../../../res/colors/colors.dart';
enum DescriptionType { time, note }

class TemplatesCard extends StatelessWidget {
  final TemplateData data;
  final DescriptionType type;

  final void Function() onPressed;

  const TemplatesCard({
    required this.onPressed,
    required this.data,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(bottom: height * 0.01, left: 10, right: 10),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(5),
          child: Container(
              height: 64,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: ProjectColors.lightGray),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20,
                        right: 15,
                        top: height * 0.01,
                        bottom: height * 0.01),
                    child: RawIcon(
                      size: 40,
                      data: data,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${data.name}',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppTypography.normal14Black),
                        Row(
                          children: [
                            Text(
                              type == DescriptionType.note
                                  ? data.note ?? ''
                                  : checkAllDay(),
                              style: AppTypography.normal10Black,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: ProjectColors.black,
                      ))
                ],
              )),
        ));
  }

  String checkAllDay() => data.allDay == true
      ? 'All day'
      : '${formatTime(data.startTime!)} - ${formatTime(data.endTime!)}';

  String formatTime(Duration time) {
    String retData = '';
    retData = time.inHours < 10 ? '0${time.inHours}' : '${time.inHours}';
    retData = time.inMinutes % 60 < 10
        ? retData + ':0${time.inMinutes % 60}'
        : retData + ':${time.inMinutes % 60}';
    return retData;
  }
}
