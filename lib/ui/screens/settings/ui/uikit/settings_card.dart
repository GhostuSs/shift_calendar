import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../../../res/colors/colors.dart';

class SettingsCard extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Widget icon;

  const SettingsCard({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(bottom: height * 0.01, left: 10, right: 10),
        child: Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: ProjectColors.lightGray),
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            child: Card(
              elevation: 0,
              borderOnForeground: false,
              color: ProjectColors.lightGray,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20,
                        right: 15,
                        top: height * 0.01,
                        bottom: height * 0.01),
                    child: icon,
                  ),
                  Text(text, style: AppTypography.normal14Black),
                  const Spacer(),
                  const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: ProjectColors.black,
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
