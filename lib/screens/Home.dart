import 'package:camnote/models/Note.dart';
import 'package:camnote/screens/Settings.dart';
import 'package:camnote/state/NotesState.dart';
import 'package:camnote/state/ThemeChanger.dart';
import 'package:camnote/utils/DatebaseHelper.dart';
import 'package:camnote/utils/ThemeList.dart';
import 'package:camnote/widgets/NoteCard.dart';
import 'package:camnote/widgets/NoteGrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:camnote/screens/New.dart';
import 'package:camnote/RouteGenerator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseHelper dbh = DatabaseHelper();
  List<Widget> pages = [];
  int selectedIndex = 0;
  String pageName = "Notes";
  bool appBarButtonsVisible = true;

  @override
  void initState() {
    super.initState();

    //pages = [NoteGrid(), New(), Settings()];
    pages.add(NoteGrid());
    //pages.add(New());
    pages.add(Settings());
    pages.add(Settings());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    // _getTheme() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   theme.setThemeWithIndex(prefs.getString('selectedTheme')!);
    // }

    return Scaffold(
      //Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        //type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          print("*******************");
          setState(() {
            if (index == 1) {
              Navigator.of(context).pushNamed("/new").then((value) {});
            } else {
              selectedIndex = index;
            }
            if (index == 2) {
              pageName = "Settings";
              appBarButtonsVisible = false;
            } else {
              pageName = "Notes";
              appBarButtonsVisible = true;
            }

            print("Navigasyon çalıştı ${selectedIndex}");
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Theme.of(context)
            .bottomNavigationBarTheme
            .unselectedItemColor, //Colors.grey.withOpacity(0.8),
      ),
      appBar: AppBar(
        title: Text(
          pageName,
          style: TextStyle(
            color:
                Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            fontSize: 35,
          ),
        ),
        actions: [
          Visibility(
            visible: appBarButtonsVisible,
            child: IconButton(
              icon: _controlThemeIcon(context),
              onPressed: () {
                if (theme.getTheme == ThemeData.dark()) {
                  theme.setTheme(ThemeList.light);
                } else {
                  theme.setTheme(ThemeData.dark());
                }
              },
            ),
          ),
          //!Search Button
          // Visibility(
          //   visible: appBarButtonsVisible,
          //   child: IconButton(
          //     icon: _controlSearchIcon(context),
          //     onPressed: () {},
          //   ),
          // )

          // Visibility(
          //   visible: appBarButtonsVisible,
          //   child: IconButton(
          //     icon: _controlPurchaseIconButton(context),
          //     onPressed: () {},
          //   ),
          // )
        ],
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: pages[selectedIndex],
    );
  }

  Widget _controlThemeIcon(context) {
    final theme = Provider.of<ThemeChanger>(context);
    if (theme.getTheme == ThemeData.dark()) {
      return Icon(
        CupertinoIcons.sun_dust,
        color: Colors.yellow,
      );
    } else {
      return Icon(CupertinoIcons.moon);
    }
  }

  Widget _controlSearchIcon(context) {
    final theme = Provider.of<ThemeChanger>(context);
    if (theme.getTheme == ThemeData.dark()) {
      return Icon(
        CupertinoIcons.search,
        color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      );
    } else {
      return Icon(
        CupertinoIcons.search,
        color: Colors.black,
      );
    }
  }

  Widget _controlPurchaseIconButton(context) {
    final theme = Provider.of<ThemeChanger>(context);
    if (theme.getTheme == ThemeData.dark()) {
      return Icon(
        CupertinoIcons.bag,
        color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      );
    } else {
      return Icon(
        CupertinoIcons.bag,
        color: Colors.black,
      );
    }
  }

  _switchTheme(context) {
    final theme = Provider.of<ThemeChanger>(context);
    if (theme.getTheme == ThemeData.dark()) {
      theme.setTheme(ThemeData.light());
    } else {
      theme.setTheme(ThemeData.dark());
    }
  }
}
