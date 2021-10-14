import 'package:camnote/models/ThemeSelectorItem.dart';
import 'package:camnote/state/ThemeChanger.dart';
import 'package:camnote/utils/ThemeList.dart';
import 'package:flutter/material.dart';
import 'package:grid_color_selector/grid_color_selector.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:grid_color_selector/base_color_grid_selector_item.dart';

class Themes extends StatefulWidget {
  const Themes({Key? key}) : super(key: key);

  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  int selectedThemeItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    List<ThemeData> themeList = [
      ThemeList.Red574144,
      ThemeList.NavyBlue2F4858,
      ThemeList.PinkBD7F9D,
      ThemeList.PinkE08F9A,
      ThemeList.Purple947297,
      ThemeList.WhiteFFF3F6,
      ThemeList.Green008076,
      ThemeList.Blue8EA1F3,
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Themes"),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 25.0,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ThemeSelectorItem(
            theme: theme.themeList[index],
            index: index,
          );
        },
        itemCount: theme.themeList.length,
      ),
    );
  }

  _getColors(context) {
    final theme = Provider.of<ThemeChanger>(context);
    return [];
  }
}
