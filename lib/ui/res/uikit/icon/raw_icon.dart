import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shift_calendar/data/template_data.dart';

import '../../colors/colors.dart';
import '../../images/icons.dart';

class RawIcon extends StatelessWidget {
  final TemplateData data;

  const RawIcon({Key? key, required this.size, required this.data})
      : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.005),
            color: data.color ?? ProjectColors.lightBlue),
        child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
            child: FittedBox(
              fit: BoxFit.fill,
              child: iconSelector(),
            )),
      );

  Widget iconSelector() {
    switch (data.iconIndex) {
      case 0:
        {
          return Image.asset(
            AppIcons.sun,
            color: ProjectColors.white,
          );
        }
      case 1:
        {
          return Image.asset(
            AppIcons.moon,
            color: ProjectColors.white,
          );
        }
      case 2:
        {
          return Image.asset(
            AppIcons.home,
            color: ProjectColors.white,
          );
        }
      case 3:
        {
          return const Icon(
            Icons.favorite,
            color: ProjectColors.white,
          );
        }
      case 4:
        {
          return Image.asset(
            AppIcons.wallet,
            color: ProjectColors.white,
          );
        }
      case 5:
        {
          return Image.asset(
            AppIcons.attention,
            color: ProjectColors.white,
          );
        }
      case 6:
        {
          return Image.asset(
            AppIcons.calendar,
            color: ProjectColors.white,
          );
        }
      case 7:
        {
          return Image.asset(
            AppIcons.star,
            color: ProjectColors.white,
          );
        }
      case 8:
        {
          return Image.asset(
            AppIcons.time,
            color: ProjectColors.white,
          );
        }
      case 9:
        {
          return Image.asset(
            AppIcons.people,
            color: ProjectColors.white,
          );
        }
      default:
        {
          return Image.asset(
            AppIcons.sun,
            color: ProjectColors.white,
          );
        }
    }
  }
}
