import 'package:camnote/RouteGenerator.dart';
import 'package:camnote/screens/Home.dart';
import 'package:camnote/state/CameraState.dart';
import 'package:camnote/state/NotesState.dart';
import 'package:camnote/state/ThemeChanger.dart';
import 'package:camnote/utils/ThemeList.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SharedPreferences.getInstance().then((val) {
    prefs = val;
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final theme = Provider.of<ThemeChanger>(context);
    return MainWidget();
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => NotesState(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeChanger(ThemeList.light),
        ),
      ],
      builder: (context, child) {
        final theme = Provider.of<ThemeChanger>(context);

        theme.getThemeWithIndex(prefControl());
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme.getTheme,

          //home: Home(),
          onGenerateRoute: RouteGenerator.routeGenerator,
        );
      },
    );
  }

  String prefControl() {
    print("CONTROL SONUCU ============>" +
        prefs!.getString('selectedTheme').toString());
    if (prefs!.getString('selectedTheme') == null ||
        prefs!.getString('selectedTheme') == '' ||
        prefs!.getString('selectedTheme') == ' ') {
      prefs!.setString('selectedTheme', '0');
      return '0';
    } else {
      return prefs!.getString('selectedTheme')!;
    }
  }
}
