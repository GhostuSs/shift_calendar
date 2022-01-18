import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shift_calendar/routes.dart';
import 'data/res/colors.dart';
import 'package:shift_calendar/routes.dart';

bool seen=false;
bool subscribe = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seen = prefs.getBool("seen") ?? false;
  await prefs.setBool("seen", true);
  subscribe = prefs.getBool("subscribe") ?? false;
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
        providers: const [
        ],
        child: MaterialApp(
            theme: ThemeData.dark(),
            color: ProjectColors.white,
            debugShowCheckedModeBanner: false,
            initialRoute: seen==true ? '/' : 'onboarding',
            routes: routes
        ));
  }
}
