import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shift_calendar/main.dart';
import 'package:shift_calendar/ui/screens/settings/ui/settings_screen.dart';
import 'package:shift_calendar/ui/screens/templates/ui/templates_screen.dart';

import '../res/colors/colors.dart';
import '../res/images/images.dart';
import 'calendar/ui/calendar_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int menuIndex = 0;
  static List pages = [
    const CalendarScreen(),
    const TemplatesScreen(),
    const SettingsScreen()
  ];

  @override
  initState() {
    menuIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: btmNavBar(),
      body: pages[menuIndex],
    );
  }

  Widget btmNavBar() {
    return Visibility(
      child: CupertinoTabBar(
        backgroundColor: ProjectColors.lightGray,
        activeColor: ProjectColors.black,
        inactiveColor: ProjectColors.usualGray,
        currentIndex: menuIndex,
        onTap: (value) {
          setState(() {
            menuIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(AppImages.calendar,
                  color: ProjectColors.usualGray,
                  filterQuality: FilterQuality.high),
              label: 'Calendar',
              activeIcon: Image.asset(AppImages.calendar,
                  color: ProjectColors.black,
                  filterQuality: FilterQuality.high)),
          BottomNavigationBarItem(
              icon: Image.asset(AppImages.templates,
                  color: ProjectColors.usualGray,
                  filterQuality: FilterQuality.high),
              label: 'Templates',
              activeIcon: Image.asset(AppImages.templates,
                  color: ProjectColors.black,
                  filterQuality: FilterQuality.high)),
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
      ),
      visible: bottomAppbar,
    );
  }
}
