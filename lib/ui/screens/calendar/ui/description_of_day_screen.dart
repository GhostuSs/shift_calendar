import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/data/template_data.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';
import 'package:shift_calendar/ui/screens/templates/ui/description_template_screen.dart';
import 'package:shift_calendar/ui/screens/templates/ui/uikit/templates_card.dart';

import '../../../../data/screen_resolution.dart';
import '../../../../data/templates_data.dart';
import '../../../res/uikit/icon/raw_icon.dart';

class DayTemplates extends StatefulWidget {
  final DateTime day;
  final VoidCallback notifyParent;

  const DayTemplates({Key? key, required this.day, required this.notifyParent})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DayTemplatesState();
  }
}

class _DayTemplatesState extends State<DayTemplates> {
  final TemplateData _initialTemplateData = TemplateData();

  @override
  initState() {
    _initialTemplateData.init(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Resolution size = context.read<Resolution>();
    final Templates prov = context.read<Templates>();
    return Scaffold(
      appBar: RawAppBar(
        height: MediaQuery.of(context).size.height,
        title: formatDate(),
        backBtn: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: ProjectColors.white,
        ),
        backgroundColor: ProjectColors.black,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => TemplateScreen(
                    data: TemplateData(date: widget.day),
                    notifyParent: () => setState(() {
                          widget.notifyParent();
                        })))),
      ),
      backgroundColor: ProjectColors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height! * 0.02, horizontal: size.height! * 0.01),
          child: Column(
            children: [
              Container(
                height: size.height! * 0.77,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        for (int index = 0;
                            index < prov.templates!.length;
                            index++)
                          prov.templates![index].date?.day == widget.day.day &&
                                  prov.templates![index].date?.month ==
                                      widget.day.month
                              ? TemplatesCard(
                                  type: DescriptionType.time,
                                  onPressed: () => onPressed(context, index),
                                  data: prov.templates![index],
                                )
                              : Container(),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: ProjectColors.backgroundGray))),
                padding: EdgeInsets.symmetric(
                    vertical: size.height! * 0.01,
                    horizontal: size.width! * 0.02),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int index = 0;
                        index < context.read<Templates>().templates!.length;
                        index++)
                      (context.read<Templates>().templates![index].date?.day ==
                                  widget.day.day &&
                              context
                                      .read<Templates>()
                                      .templates![index]
                              .date
                                      ?.month ==
                                  widget.day.month)
                          ? Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: RawIcon(
                                size: size.height! * 0.035,
                                data:
                                    context.read<Templates>().templates![index],
                              ),
                            )
                          : Container(),
/*
                    context.read<Templates>().templates!.where((element) => element.date?.day==widget.day.day && element.date?.month==widget.day.month).length>9
                        ? Padding(
                        padding: EdgeInsets.only(right: size.height! * 0.0055),
                        child: Container(
                          width: size.height!*0.036,
                          height: size.height!*0.036,
                          child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(size.height! * 0.005),
                                child: Text(
                                  '+${prov.templates!.where((element) => element.date?.day == widget.day?.day && element.date?.month == widget.day?.month).length - 3}',
                                  style: TextStyle(
                                    color: ProjectColors.white,
                                    fontSize: size.height!*0.015,
                                    fontFamily: 'sfprodisplay'
                                  ),
                                )),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ProjectColors.darkGray),
                        ))
                        :Container()*/
                  ],
                ),
              )
            ],
          )),
    );
  }

  String formatDate() {
    String retData = '';
    retData = widget.day.day.toString();
    retData = month(widget.day) + retData;

    return retData;
  }

  String month(DateTime date) {
    switch (date.month) {
      case 1:
        {
          return 'January ';
        }
      case 2:
        {
          return 'February ';
        }
      case 3:
        {
          return 'March ';
        }
      case 4:
        {
          return 'April ';
        }
      case 5:
        {
          return 'May ';
        }
      case 6:
        {
          return 'June ';
        }
      case 7:
        {
          return 'July ';
        }
      case 8:
        {
          return 'August ';
        }
      case 9:
        {
          return 'September ';
        }
      case 10:
        {
          return 'October ';
        }
      case 11:
        {
          return 'November ';
        }

      case 12:
        {
          return 'December ';
        }
      default:
        {
          return 'Unknown';
        }
    }
  }

  onPressed(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => TemplateScreen(
                enableDeleting: Deleting.enabled,
                data: context.read<Templates>().templates?[index],
                notifyParent: () => setState(() {}))));
  }
}
