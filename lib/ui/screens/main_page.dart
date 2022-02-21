import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              icon: SvgPicture.asset(
                AppImages.calendar,
                color: ProjectColors.usualGray,
              ),
              label: 'Calendar',
              activeIcon: SvgPicture.asset(AppImages.calendar,
                  color: ProjectColors.black)),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.templates,
                color: ProjectColors.usualGray,
              ),
              label: 'Templates',
              activeIcon: SvgPicture.asset(
                AppImages.templates,
                color: ProjectColors.black,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.settings,
                color: ProjectColors.usualGray,
              ),
              label: 'Settings',
              activeIcon: SvgPicture.asset(
                AppImages.settings,
                color: ProjectColors.black,
              )),
        ],
      ),
      visible: bottomAppbar,
    );
  }
}
