import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';
import 'package:shift_calendar/ui/screens/templates/ui/uikit/templates_card.dart';

import '../../../res/images/icons.dart';
import 'description_template_screen.dart';

class TemplatesScreen extends StatefulWidget {
  const TemplatesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TemplatesScreenState();
  }
}

onPressed(BuildContext context) {
  Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => TemplateScreen()));
}

class _TemplatesScreenState extends State<TemplatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RawAppBar(
        height: MediaQuery.of(context).size.height,
        title: 'Templates',
      ),
      backgroundColor: ProjectColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            Column(
              children: [
                TemplatesCard(
                  icon: AppIcons.sun,
                  text: 'Day work shift',
                  onPressed: () => onPressed(context),
                  iconColor: ProjectColors.darkBlue,
                  subtext: '9:00 am - 05:00 pm',
                ),
                TemplatesCard(
                  icon: AppIcons.moon,
                  text: 'Night work shift',
                  onPressed: () => onPressed(context),
                  iconColor: ProjectColors.darkGray,
                  subtext: '10:00 pm - 06:00 am',
                ),
                TemplatesCard(
                  icon: AppIcons.home,
                  text: 'Weekend',
                  onPressed: () => onPressed(context),
                  iconColor: ProjectColors.orange,
                  subtext: 'All day',
                ),
                TemplatesCard(
                  icon: AppIcons.sun,
                  text: 'Day work shift',
                  onPressed: () => onPressed(context),
                  iconColor: ProjectColors.darkBlue,
                  subtext: '9:00 am - 05:00 pm',
                ),
                TemplatesCard(
                  icon: AppIcons.wallet,
                  text: 'Salary',
                  onPressed: () => onPressed(context),
                  iconColor: ProjectColors.darkGreen,
                  subtext: 'All day',
                ),
                TemplatesCard(
                  icon: AppIcons.attention,
                  text: 'Important day',
                  onPressed: () => onPressed(context),
                  iconColor: ProjectColors.purple,
                  subtext: 'All day',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
