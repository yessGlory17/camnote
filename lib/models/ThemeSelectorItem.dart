import 'package:camnote/state/ThemeChanger.dart';
import 'package:camnote/utils/AdsHelper.dart';
import 'package:camnote/utils/ThemeList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grid_color_selector/base_color_grid_selector_item.dart';
import 'package:grid_color_selector/grid_color_selector_item.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSelectorItem extends StatefulWidget {
  ThemeData theme;
  int index;
  ThemeSelectorItem({Key? key, required this.theme, required this.index})
      : super(key: key);

  @override
  _ThemeSelectorItemState createState() => _ThemeSelectorItemState();
}

class _ThemeSelectorItemState extends State<ThemeSelectorItem> {
  bool isSelected = false;
  AdsHelper adsHelper = AdsHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    print("TEMA Seçim Butonu Oluşturuldu!");

    if (theme.getTheme == widget.theme) {
      isSelected = true;
    } else {
      isSelected = false;
    }

    return GestureDetector(
      child: Container(
        child: _getIcon(),
        decoration: BoxDecoration(
            color: widget.theme.primaryColor,
            borderRadius: BorderRadius.circular(10),
            border: getBorder()),
      ),
      onTap: () {
        //adsHelper.showRewardAd();

        SharedPreferences? prefs;
        SharedPreferences.getInstance().then((value) {
          //int currentThemeIndex = int.parse(prefs!.getString('selectedTheme')!);
          print("********************************************************");
          // print(
          //     "TEMA AYARLARI GETİRİLDİ!" + prefs!.getString('selectedTheme')!);
          print("********************************************************");

          // if (currentThemeIndex != widget.index) {
          //   isSelected = false;
          //   setState(() {});
          // }
        });

        if (isSelected) {
          setState(() {
            isSelected = false;
            theme.setTheme(ThemeList.light);
          });
        } else {
          setState(() {
            isSelected = true;
            theme.setTheme(widget.theme);
            //adsHelper.loadRewardedAd(widget.theme, context);
          });
        }
      },
    );
  }

  Border getBorder() {
    if (isSelected) {
      //setState(() {});
      return Border.all(
          color: Colors.greenAccent, width: 5, style: BorderStyle.solid);
    } else {
      //setState(() {});
      return Border.all(
          color: Colors.blueAccent, width: 2, style: BorderStyle.none);
    }
  }

  Widget _getIcon() {
    if (isSelected) {
      //setState(() {});
      return Icon(CupertinoIcons.check_mark);
    } else {
      //setState(() {});
      return Container();
    }
  }
}
