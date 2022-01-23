import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/images/images.dart';

CupertinoTabBar btmNavBar(int selectedIndex) {
  return CupertinoTabBar(
    backgroundColor: ProjectColors.lightGray,
    activeColor: ProjectColors.black,
    inactiveColor: ProjectColors.usualGray,
    currentIndex: selectedIndex,
    items: [
      BottomNavigationBarItem(
          icon: Image.asset(AppImages.calendar,
              color: ProjectColors.usualGray,
              filterQuality: FilterQuality.high),
          label: 'Calendar',
          activeIcon: Image.asset(AppImages.calendar,
              color: ProjectColors.black, filterQuality: FilterQuality.high)),
      BottomNavigationBarItem(
          icon: Image.asset(AppImages.templates,
              color: ProjectColors.usualGray,
              filterQuality: FilterQuality.high),
          label: 'Templates',
          activeIcon: Image.asset(AppImages.templates,
              color: ProjectColors.black, filterQuality: FilterQuality.high)),
      BottomNavigationBarItem(
          icon: Image.asset(AppImages.settings,
              color: ProjectColors.usualGray,
              filterQuality: FilterQuality.high),
          label: 'Settings',
          activeIcon: Image.asset(
            AppImages.settings,
            color: ProjectColors.black,
            filterQuality: FilterQuality.high,
          )),
    ],
  );
}
