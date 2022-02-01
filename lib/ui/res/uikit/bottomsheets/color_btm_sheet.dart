import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

class ColorBtmSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ColorBtmSheetState();
  }
}

class _ColorBtmSheetState extends State<ColorBtmSheet> {
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
                'Select color',
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
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.amber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.orange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.coralRed,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.purple,
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
                      backgroundColor: ProjectColors.lightGreen,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.darkGreen,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.lightBlue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.darkBlue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: ProjectColors.darkGray,
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
