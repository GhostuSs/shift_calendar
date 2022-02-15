import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/data/template_data.dart';
import 'package:shift_calendar/ui/res/images/icons.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';
import 'package:shift_calendar/ui/res/uikit/bottomsheets/color_btm_sheet.dart';
import 'package:shift_calendar/ui/res/uikit/bottomsheets/time_sheet.dart';

import '../../../../data/templates_data.dart';
import '../../../res/colors/colors.dart';
import '../../../res/uikit/bottomsheets/icon_bottomsheet.dart';
enum Deleting { enabled, disabled }

class TemplateScreen extends StatefulWidget {
  final TemplateData? data;
  final void Function() notifyParent;
  final Deleting? enableDeleting;

  const TemplateScreen(
      {this.data, required this.notifyParent, this.enableDeleting});

  @override
  State<StatefulWidget> createState() {
    return _TemplateScreenState();
  }
}

class _TemplateScreenState extends State<TemplateScreen> {
  late TemplateData templateData;
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    templateData = widget.data ?? TemplateData();
    nameController.text = templateData.name ?? '';
    descController.text = templateData.note ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RawAppBar(
        height: MediaQuery.of(context).size.height,
        title: 'Template',
        backBtn: true,
        addBtn: true,
        onPressed: () {
          final Templates prov = context.read<Templates>();
          if (prov.templates!.contains(templateData)) {
          } else {
            context.read<Templates>().templates!.add(templateData);
          }
          widget.notifyParent();
          Navigator.pop(context);
        },
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                  onChanged: (value) => {templateData.name = value},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextFormField(
                    minLines: 2,
                    maxLines: 4,
                    maxLength: 30,
                    controller: descController,
                    onChanged: (value) => {templateData.note = value},
                    decoration: const InputDecoration(hintText: 'Write a note'),
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
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 5),
                          child: Row(
                            children: [
                              const Text(
                                'Select icon',
                                style: AppTypography.normal14Black,
                              ),
                              const Spacer(),
                              Container(
                                width: 18,
                                height: 18,
                                child: iconSelector(),
                              ),
                              IconButton(
                                  onPressed: () => showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          IconBtmSheet(
                                            templateData: templateData,
                                            notifyParent: () => setState(() {}),
                                          )),
                                  icon: const Icon(
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
                              const Spacer(),
                              Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      color: templateData.color,
                                      borderRadius:
                                          BorderRadius.circular(9.0))),
                              IconButton(
                                  onPressed: () => showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          ColorBtmSheet(
                                              templateData: templateData,
                                              notifyParent: () =>
                                                  setState(() {}))),
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
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 5),
                            child: Row(
                              children: [
                                const Text(
                                  'All day',
                                  style: AppTypography.normal14Black,
                                ),
                                const Spacer(),
                                CupertinoSwitch(
                                    value: templateData.allDay ?? false,
                                    onChanged: (value) => setState(
                                        () => templateData.allDay = value))
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
                                const Text(
                                  'Start',
                                  style: AppTypography.normal14Black,
                                ),
                                const Spacer(),
                                Text(formatTime(templateData.startTime ??
                                    const Duration(hours: 0, seconds: 0))),
                                IconButton(
                                    splashRadius: 1.0,
                                    iconSize: 10,
                                    onPressed: () => showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            TimeBtmSheet(
                                              templateData: templateData,
                                              notifyParent: () =>
                                                  setState(() {}),
                                              typeOfTime: TypeOfTime.start,
                                            )),
                                    icon: const Icon(
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
                                const Text(
                                  'Finish',
                                  style: AppTypography.normal14Black,
                                ),
                                const Spacer(),
                                Text(formatTime(templateData.endTime ??
                                    const Duration(hours: 0, seconds: 0))),
                                IconButton(
                                    splashRadius: 1.0,
                                    iconSize: 10,
                                    onPressed: () => showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            TimeBtmSheet(
                                              templateData: templateData,
                                              notifyParent: () =>
                                                  setState(() {}),
                                              typeOfTime: TypeOfTime.finish,
                                            )),
                                    icon: const Icon(
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
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 5),
                            child: Row(
                              children: [
                                const Text(
                                  'Notifications',
                                  style: AppTypography.normal14Black,
                                ),
                                const Spacer(),
                                CupertinoSwitch(
                                    value: templateData.notifications ?? false,
                                    onChanged: (value) => setState(() =>
                                        templateData.notifications = value))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.enableDeleting == Deleting.enabled
                          ? TextButton(
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                        title: Text('Delete shift?'),
                                        content: Text(
                                            'Are you sure you want to delete the shift?'),
                                        actions: [
                                          CupertinoDialogAction(
                                            child: const Text('Cancel'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          CupertinoDialogAction(
                                            child: const Text(
                                              'Delete',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            isDefaultAction: true,
                                            onPressed: () {
                                              context
                                                  .read<Templates>()
                                                  .templates!
                                                  .remove(templateData);
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      )),
                              child: const Text(
                                'Delete shift',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'sfprodisplay',
                                    fontSize: 16),
                              ))
                          : Container()
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget iconSelector() {
    switch (templateData.iconIndex) {
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

  String formatTime(Duration time) {
    String retData = '';
    retData = time.inHours < 10 ? '0${time.inHours}' : '${time.inHours}';
    retData = time.inMinutes % 60 < 10
        ? retData + ':0${time.inMinutes % 60}'
        : retData + ':${time.inMinutes % 60}';
    return retData;
  }
}
