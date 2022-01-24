import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/btm_nav_bar.dart';
import 'package:shift_calendar/ui/screens/settings/ui/settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final int menuIndex = 0;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: ProjectColors.white,
      tabBar: btmNavBar(menuIndex),
      tabBuilder: (BuildContext context, _selectedIndex) {
        List pages = [SettingsScreen(), SettingsScreen(), SettingsScreen()];
        return CupertinoTabView(builder: (context) {
          switch (_selectedIndex) {
            case 1:
              {
                return new SettingsScreen();
              }
            case 2:
              {
                return new SettingsScreen();
              }
            default:
              {
                return pages[_selectedIndex];
              }
          }
        });
      },
    );
  }
}
