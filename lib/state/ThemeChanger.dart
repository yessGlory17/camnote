import 'package:camnote/utils/ThemeList.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  List<ThemeData> themeList = [
    ThemeList.light,
    ThemeList.dark,
    ThemeList.Red574144,
    ThemeList.NavyBlue2F4858,
    ThemeList.PinkBD7F9D,
    ThemeList.PinkE08F9A,
    ThemeList.Purple947297,
    ThemeList.WhiteFFF3F6,
    ThemeList.Green008076,
    ThemeList.Blue8EA1F3,
  ];

  ThemeData _themeData = ThemeData.light();

  ThemeChanger(this._themeData);

  get getTheme => _themeData;

  setTheme(ThemeData theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = 0;

    for (ThemeData ListTheme in themeList) {
      if (ListTheme == theme) {
        _themeData = theme;
        prefs.setString('selectedTheme', index.toString());
      }
      index++;
    }
    //Burada Ayarlanan temayı kaydet.
    print("TEMA AYARLANDI!");
    notifyListeners();
  }

  setThemeWithIndex(String index) {
    if (index == 'null' || index == null || index == '') {
      _themeData = ThemeData.light();
      notifyListeners();
      print("Tema Default Ayarlandı");
    } else {
      _themeData = themeList[int.parse(index)];
      print("TEMA YÜKLENDİ!");
      notifyListeners();
    }
  }

  getThemeWithIndex(String index) {
    if (index == null || index == '' || index == ' ') {
      _themeData = themeList[0];
    } else {
      _themeData = themeList[int.parse(index)];
    }
    return _themeData;
  }
}
