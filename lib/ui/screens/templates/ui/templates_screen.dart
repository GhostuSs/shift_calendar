import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/uikit/appbars/raw_appbar.dart';

class TemplatesScreen extends StatefulWidget {
  const TemplatesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TemplatesScreenState();
  }
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
      body: Column(
        children: const [
          Text(
            'soon',
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
