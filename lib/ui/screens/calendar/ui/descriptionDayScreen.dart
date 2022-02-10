import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/data/template_data.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';
import 'package:shift_calendar/ui/screens/templates/ui/uikit/templates_card.dart';

import '../../../../data/templates_data.dart';
import '../../../res/uikit/icon/raw_icon.dart';

class DayTemplates extends StatefulWidget {
  final DateTime day;

  const DayTemplates({Key? key, required this.day}) : super(key: key);

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
    final Templates prov = context.read<Templates>();
    return Scaffold(
      appBar: RawAppBar(
        height: MediaQuery.of(context).size.height,
        title: formatDate(),
        backBtn: true,
      ),
      floatingActionButton: context.read<Templates>().templates?.isEmpty == true
          ? FloatingActionButton(
              onPressed: () => print('pressed'),
              backgroundColor: ProjectColors.black,
              child: const Icon(
                Icons.add,
                color: ProjectColors.white,
              ),
            )
          : Container(),
      backgroundColor: ProjectColors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 400,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        for (int index = 0;
                            index < prov.templates!.length;
                            index++)
                          TemplatesCard(
                            onPressed: () => onPressed(context, index),
                            data: prov.templates![index],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: 80,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int index = 0;
                        index < context.read<Templates>().templates!.length;
                        index++)
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: RawIcon(
                          size: 30,
                          data: context.read<Templates>().templates![index],
                        ),
                      )
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
    print('pressed');
  }
}
