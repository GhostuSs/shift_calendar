import 'package:flutter/material.dart';
import 'package:shift_calendar/data/template_data.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';
import 'package:shift_calendar/ui/res/uikit/icon/raw_icon.dart';

import '../../../../res/colors/colors.dart';

class TemplatesCard extends StatelessWidget {
  final TemplateData data;
  final void Function() onPressed;

  const TemplatesCard({
    required this.onPressed,
    required this.data,
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name ?? 'Unknown',
                          style: AppTypography.normal14Black),
                      Text(
                        data.note ?? 'Unknown',
                        style: AppTypography.normal10Black,
                      )
                    ],
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
}
