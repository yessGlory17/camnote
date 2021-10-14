import 'dart:async';
import 'dart:math';

import 'package:camnote/models/Note.dart';
import 'package:camnote/state/NotesState.dart';
import 'package:camnote/state/ThemeChanger.dart';
import 'package:camnote/utils/DatebaseHelper.dart';
import 'package:camnote/widgets/DayButton/DayButton.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:camnote/screens/Detail.dart';
import 'package:camnote/screens/Home.dart';
import 'package:camnote/screens/New.dart';
import 'package:camnote/screens/ResultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:camnote/widgets/ResultBottomSheet.dart';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:grid_color_selector/base_color_grid_selector_item.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:grid_color_selector/grid_color_selector.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var port = ReceivePort();

  String mes = "";

  bool show = false;
  String content = "";
  var pageData;
  String selectedText = "";
  int selectedColorItem = 1;
  bool isRemind = false;
  bool isLoaded = false;

  DatabaseHelper dbh = DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    pageData = ModalRoute.of(context)!.settings.arguments;

    Color archiveColor = Colors.black87;
    return Consumer<NotesState>(builder: (context, state, widget) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                },
                icon: Icon(CupertinoIcons.back)),
            backgroundColor: Theme.of(context).primaryColor,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            elevation: 0,
            actions: [
              //Remove Button
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          content: Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            height: 300,
                            child: Column(
                              children: [
                                GridColorSelector<int>(
                                  selectedItemKey: selectedColorItem + 1,
                                  title: "Select A Note Color",
                                  items: _getColors(),
                                  onSelectionChanged: (option) {
                                    print(option);
                                    selectedColorItem = option;
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: Icon(Icons.palette_outlined),
                color: archiveColor,
              ),

              //Reminder Button
              IconButton(
                onPressed: () {
                  setState(() {
                    if (isRemind) {
                      isRemind = false;
                    } else {
                      isRemind = true;
                    }
                  });
                },
                icon: getRemindButton(),
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SelectableText(
              pageData,
              scrollPhysics: BouncingScrollPhysics(),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              toolbarOptions: ToolbarOptions(
                  copy: false, cut: false, paste: false, selectAll: false),
              style: TextStyle(fontSize: 18),
              onSelectionChanged: (selection, cause) {
                selectedText = pageData
                    .toString()
                    .substring(selection.start, selection.end);

                if (selectedText.length > 0) {
                  setState(() {
                    //archiveColor = Colors.greenAccent;
                    selectedText = pageData
                        .toString()
                        .substring(selection.start, selection.end);
                    show = true;
                  });
                } else {
                  setState(() {
                    show = false;
                  });
                }
              },
            )),
        floatingActionButton: Visibility(
            visible: show,
            child: FloatingActionButton.extended(
              icon: Icon(
                CupertinoIcons.archivebox,
                color: Colors.white,
              ),
              backgroundColor: Colors.greenAccent,
              label: Text(
                "Save",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              onPressed: () {
                List<BaseGridColorSelectorItem> colors = _getColors();
                Note newNote = Note(
                    generateId(),
                    selectedText,
                    colors[selectedColorItem - 1].primaryColor,
                    //DateFormat.yMMMMd('en_US').format(DateTime.now()),
                    isRemind.toString());
                var res = dbh.addNote(newNote);
                res.then((value) {
                  print("Kaydedildi! => " + value.toString());
                  print("Kaydedilen Text : " + selectedText);
                  setState(() {
                    state.add(newNote);

                    //adsHelper.loadRewardedAd(context);
                    //Provider.of<NotesState>(context, listen: true).refresh();
                  });

                  Navigator.popUntil(context, (route) => route.isFirst);
                  Toast.show("Saved", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                });
                state.add(newNote);
              },
            )),
      );
    });
  }

  _getColors() {
    return [
      BaseGridColorSelectorItem(
        key: 1,
        primaryColor: Color(0xFFFFAB91),
      ),
      BaseGridColorSelectorItem(
        key: 2,
        primaryColor: Color(0xFFFFCC80),
      ),
      BaseGridColorSelectorItem(
        key: 3,
        primaryColor: Color(0xFFE6EE9B),
      ),
      BaseGridColorSelectorItem(
        key: 4,
        primaryColor: Color(0xFF80DEEA),
      ),
      BaseGridColorSelectorItem(
        key: 5,
        primaryColor: Color(0xFFCF93D9),
      ),
      BaseGridColorSelectorItem(
        key: 6,
        primaryColor: Color(0xFFE08F9A),
      ),
      BaseGridColorSelectorItem(
        key: 7,
        primaryColor: Color(0xFFB37B9C),
      ),
      BaseGridColorSelectorItem(
        key: 8,
        primaryColor: Color(0xFF72E9E0),
      ),
      BaseGridColorSelectorItem(
        key: 9,
        primaryColor: Color(0xFFC1FCF6),
      ),
      BaseGridColorSelectorItem(
        key: 10,
        primaryColor: Color(0xFFB2BC72),
      ),
      BaseGridColorSelectorItem(
        key: 11,
        primaryColor: Color(0xFF72E9E0),
      ),
      BaseGridColorSelectorItem(
        key: 12,
        primaryColor: Color(0xFF9CF8AD),
      ),
      BaseGridColorSelectorItem(
        key: 13,
        primaryColor: Color(0xFFC7FB8D),
      ),
    ];
  }

  int generateId() {
    int min = 100000; //min and max values act as your 6 digit range
    int max = 999999;
    var randomizer = new Random();
    var rNum = min + randomizer.nextInt(max - min);

    return rNum;
  }

  Icon getRemindButton() {
    if (isRemind == false) {
      return Icon(Icons.notifications_off_outlined);
    } else {
      return Icon(Icons.notifications_active_outlined);
    }
  }
}
