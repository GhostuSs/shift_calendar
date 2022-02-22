import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/data/template_data.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';
import 'package:shift_calendar/ui/screens/templates/ui/uikit/templates_card.dart';

import '../../../../data/templates_data.dart';
import 'description_template_screen.dart';

class TemplatesScreen extends StatefulWidget {
  const TemplatesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TemplatesScreenState();
  }
}

class _TemplatesScreenState extends State<TemplatesScreen> {
  final TemplateData _initialTemplateData = TemplateData();

  @override
  initState() {
    _initialTemplateData.init(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Templates prov = context.read<Templates>();
    return WillPopScope(
      child: Scaffold(
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
                  for (int index = 0; index < prov.templates!.length; index++)
                    prov.templates![index].date == null
                        ? TemplatesCard(
                            type: DescriptionType.time,
                            onPressed: () => onPressed(context, index),
                            data: prov.templates![index],
                          )
                        : Container()
                ],
              )
            ],
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }

  onPressed(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => TemplateScreen(
                  data: context.read<Templates>().templates![index],
                  notifyParent: () => setState(() {}),
                )));
  }
}
