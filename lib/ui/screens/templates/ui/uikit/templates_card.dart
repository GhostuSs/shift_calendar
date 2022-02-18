import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/data/template_data.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';
import 'package:shift_calendar/ui/res/uikit/icon/raw_icon.dart';

import '../../../../../data/screen_resolution.dart';
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
    final Resolution size = context.read<Resolution>();
    return Padding(
        padding: EdgeInsets.only(
            bottom: size.height! * 0.01,
            left: size.width! * 0.02,
            right: size.width! * 0.02),
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
                        left: size.height! * 0.035,
                        right: size.height! * 0.035,
                        top: size.height! * 0.01,
                        bottom: size.height! * 0.01),
                    child: RawIcon(
                      size: 30,
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
                  Padding(
                      padding: EdgeInsets.only(right: size.height! * 0.016),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: size.height! * 0.02,
                        color: ProjectColors.black,
                      ))
                ],
              )),
        ));
  }

  String checkAllDay() => data.allDay == true
      ? 'All day'
      : '${formatTime(data.startTime ?? const Duration(hours: 0, minutes: 0), data.amPmStart ?? 0)} - ${formatTime(data.endTime ?? const Duration(hours: 0, minutes: 0), data.amPmEnd ?? 0)}';

  String formatTime(Duration time, int amPm) {
    String retData = '';
    retData = time.inHours % 12 < 10
        ? '0${time.inHours % 12}'
        : '${time.inHours % 12}';
    retData = time.inMinutes % 60 < 10
        ? retData + ':0${time.inMinutes % 60}'
        : retData + ':${time.inMinutes % 60}';
    retData = amPm == 1 ? retData + ' PM' : retData + ' AM';
    return retData;
  }
}
