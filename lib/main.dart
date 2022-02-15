import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shift_calendar/routes.dart';
import 'package:shift_calendar/ui/res/theme.dart';

import 'data/screen_resolution.dart';
import 'data/templates_data.dart';
import 'ui/res/colors/colors.dart';

bool seen = false;
bool subscribe = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seen = prefs.getBool("seen") ?? false;
  await prefs.setBool("seen", true);
  runApp(const App());
}

class App extends StatefulWidget{
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Templates>(create: (_) => Templates()),
        Provider<Resolution>(create: (_) => Resolution()),
      ],
      child: MaterialApp(
          theme: AppTheme.theme,
          color: ProjectColors.white,
          debugShowCheckedModeBanner: false,
          initialRoute: seen == true ? '/' : '/onboarding',
          routes: routes),
    );
  }
}
