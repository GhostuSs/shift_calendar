import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shift_calendar/data/template_data.dart';

import '../../colors/colors.dart';
import '../../images/icons.dart';

class RawIcon extends StatelessWidget {
  final TemplateData data;

  const RawIcon({required this.size, required this.data});

  final double size;

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: data.color ?? ProjectColors.lightBlue),
        child: Padding(padding: const EdgeInsets.all(5), child: iconSelector()),
      );

  Widget iconSelector() {
    switch (data.iconIndex) {
      case 0:
        {
          return Image.asset(AppIcons.sun);
        }
      case 1:
        {
          return Image.asset(AppIcons.moon);
        }
      case 2:
        {
          return Image.asset(AppIcons.home);
        }
      case 3:
        {
          return const Icon(
            Icons.favorite,
            size: 18,
          );
        }
      case 4:
        {
          return Image.asset(AppIcons.wallet);
        }
      case 5:
        {
          return Image.asset(AppIcons.attention);
        }
      case 6:
        {
          return Image.asset(AppIcons.calendar);
        }
      case 7:
        {
          return Image.asset(AppIcons.star);
        }
      case 8:
        {
          return Image.asset(AppIcons.time);
        }
      case 9:
        {
          return Image.asset(AppIcons.people);
        }
      default:
        {
          return Image.asset(AppIcons.sun);
        }
    }
  }
}
