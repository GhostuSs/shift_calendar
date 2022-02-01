import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/images/icons.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';
import 'package:shift_calendar/ui/res/uikit/bottomsheets/color_btm_sheet.dart';
import 'package:shift_calendar/ui/res/uikit/bottomsheets/time_sheet.dart';

import '../../../res/colors/colors.dart';
import '../../../res/uikit/bottomsheets/icon_bottomsheet.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TemplateScreenState();
  }
}

class _TemplateScreenState extends State<TemplateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  bool allDayEnable = false;
  bool notificationsEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RawAppBar(
        height: MediaQuery.of(context).size.height,
        title: 'Template',
        backBtn: true,
        addBtn: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: TextFormField(
                minLines: 2,
                maxLines: 4,
                maxLength: 30,
                controller: descController,
                decoration: InputDecoration(hintText: 'Write a note'),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: ProjectColors.lightGray),
              child: Column(
                children: [
                  InkWell(
                    focusColor: ProjectColors.white,
                    splashColor: ProjectColors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 5),
                      child: Row(
                        children: [
                          Text(
                            'Select icon',
                            style: AppTypography.normal14Black,
                          ),
                          Spacer(),
                          Container(
                            width: 18,
                            height: 18,
                            child: Image.asset(AppIcons.sun),
                          ),
                          IconButton(
                              onPressed: () => showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      IconBtmSheet()),
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: ProjectColors.black,
                                size: 10,
                              ))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    focusColor: ProjectColors.white,
                    splashColor: ProjectColors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 5),
                      child: Row(
                        children: [
                          const Text(
                            'Select color',
                            style: AppTypography.normal14Black,
                          ),
                          Spacer(),
                          Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                  color: ProjectColors.darkBlue,
                                  borderRadius: BorderRadius.circular(9.0))),
                          IconButton(
                              onPressed: () => showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      ColorBtmSheet()),
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: ProjectColors.black,
                                size: 10,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: ProjectColors.lightGray),
                child: Column(
                  children: [
                    InkWell(
                      focusColor: ProjectColors.white,
                      splashColor: ProjectColors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 5),
                        child: Row(
                          children: [
                            Text(
                              'All day',
                              style: AppTypography.normal14Black,
                            ),
                            Spacer(),
                            CupertinoSwitch(
                                value: allDayEnable,
                                onChanged: (value) =>
                                    setState(() => allDayEnable = value))
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      focusColor: ProjectColors.white,
                      splashColor: ProjectColors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 15),
                        child: Row(
                          children: [
                            Text(
                              'Start',
                              style: AppTypography.normal14Black,
                            ),
                            Spacer(),
                            Text('09:00'),
                            IconButton(
                                splashRadius: 1.0,
                                iconSize: 10,
                                onPressed: () => showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        TimeBtmSheet(
                                          label: 'Start',
                                        )),
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: ProjectColors.black,
                                  size: 10,
                                ))
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      focusColor: ProjectColors.white,
                      splashColor: ProjectColors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 15),
                        child: Row(
                          children: [
                            Text(
                              'Finish',
                              style: AppTypography.normal14Black,
                            ),
                            Spacer(),
                            Text('23:00'),
                            IconButton(
                                splashRadius: 1.0,
                                iconSize: 10,
                                onPressed: () => showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        TimeBtmSheet(
                                          label: 'Start',
                                        )),
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: ProjectColors.black,
                                  size: 10,
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: ProjectColors.lightGray),
                child: Column(
                  children: [
                    InkWell(
                      focusColor: ProjectColors.white,
                      splashColor: ProjectColors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 5),
                        child: Row(
                          children: [
                            Text(
                              'Notifications',
                              style: AppTypography.normal14Black,
                            ),
                            Spacer(),
                            CupertinoSwitch(
                                value: notificationsEnable,
                                onChanged: (value) =>
                                    setState(() => notificationsEnable = value))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
