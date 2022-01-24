import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../../../res/colors/colors.dart';

class TemplatesCard extends StatelessWidget {
  final String text;
  final String subtext;
  final void Function() onPressed;
  final String icon;
  final Color iconColor;

  const TemplatesCard({
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.subtext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(bottom: height * 0.01, left: 10, right: 10),
        child: Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: ProjectColors.lightGray),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(5.0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 15,
                      top: height * 0.01,
                      bottom: height * 0.01),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: iconColor),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        icon,
                        filterQuality: FilterQuality.high,
                        color: ProjectColors.white,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text, style: AppTypography.normal14Black),
                    Text(
                      subtext,
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
            ),
          ),
        ));
  }
}
