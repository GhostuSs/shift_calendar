import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/screens/settings/ui/uikit/settings_card.dart';

import '../../../res/colors/colors.dart';
import '../../../res/uikit/appbars/raw_appbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.white,
      appBar: RawAppBar(
        title: 'Settings',
        height: MediaQuery.of(context).size.height,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          children: [
            SettingsCard(
              icon: const Icon(
                Icons.info_outline_rounded,
                color: ProjectColors.black,
              ),
              text: 'Terms of Use',
              onPressed: () {},
            ),
            SizedBox(
              height: 5,
            ),
            SettingsCard(
              icon: const Icon(
                Icons.privacy_tip_rounded,
                color: ProjectColors.black,
              ),
              text: 'Privacy policy',
              onPressed: () {},
            ),
            SizedBox(
              height: 5,
            ),
            SettingsCard(
              icon: const Icon(
                Icons.support_rounded,
                color: ProjectColors.black,
              ),
              text: 'Support',
              onPressed: () {},
            ),
            SizedBox(
              height: 5,
            ),
            SettingsCard(
              icon: const Icon(
                Icons.star_rate_rounded,
                color: ProjectColors.black,
              ),
              text: 'Rate app',
              onPressed: () {},
            ),
            SizedBox(
              height: 5,
            ),
            SettingsCard(
              icon: const Icon(
                Icons.share_rounded,
                color: ProjectColors.black,
              ),
              text: 'Share',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
