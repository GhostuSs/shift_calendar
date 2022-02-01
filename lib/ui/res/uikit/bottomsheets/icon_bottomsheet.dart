import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../images/icons.dart';

class IconBtmSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IconBtmSheetState();
  }
}

class _IconBtmSheetState extends State<IconBtmSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                'Select icon',
                style: AppTypography.regular18Black,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: ProjectColors.backgroundGray,
                      child: Image.asset(AppIcons.sun),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.backgroundGray,
                    child: Image.asset(AppIcons.moon),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.backgroundGray,
                    child: Image.asset(AppIcons.home),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.backgroundGray,
                    child: Icon(
                      Icons.favorite,
                      color: ProjectColors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.backgroundGray,
                    child: Image.asset(AppIcons.wallet),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: ProjectColors.backgroundGray,
                      child: Image.asset(AppIcons.attention),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.backgroundGray,
                    child: Image.asset(AppIcons.calendar),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.backgroundGray,
                    child: Image.asset(AppIcons.star),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.backgroundGray,
                    child: Image.asset(AppIcons.time),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.backgroundGray,
                    child: Image.asset(AppIcons.people),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
