import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';

import '../../../res/colors/colors.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TemplateScreenState();
  }
}

class _TemplateScreenState extends State<TemplateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.white,
      appBar: RawAppBar(
        height: MediaQuery.of(context).size.height,
        title: 'Template',
        backBtn: true,
        addBtn: true,
      ),
      body: Column(
        children: [
          Text(
            'soon',
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
