import 'package:camnote/models/Note.dart';
import 'package:camnote/state/NotesState.dart';
import 'package:camnote/state/ThemeChanger.dart';
import 'package:camnote/utils/DatebaseHelper.dart';
import 'package:camnote/utils/NotificationHelper.dart';
import 'package:camnote/utils/ThemeList.dart';
import 'package:camnote/widgets/TimePicker/TimePicker.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  NotificationHelper notificationHelper = NotificationHelper();

  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    notificationHelper.initiliazeNotification();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    var note = args['note'];
    var id = args['id'];
    var color = args['color'];
    var date = args['date'];
    var isRemind = args['remind'];
    DatabaseHelper dbh = DatabaseHelper();
    final theme = Provider.of<ThemeChanger>(context);

    return Consumer<NotesState>(
      builder: (context, state, widget) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            elevation: 0,
            actions: [
              //Remove Button
              IconButton(
                onPressed: () {
                  var result = dbh.deleteNote(id);
                  Toast.show("Deleted", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  Navigator.of(context).pop();
                },
                icon: Icon(CupertinoIcons.delete),
                color: Colors.redAccent,
              ),

              //Reminder Button
              IconButton(
                onPressed: () {
                  print("Bildirim butonuna basıldı!");

                  //Update Note

                  if (isRemind == 'false') {
                    isRemind = 'true';
                  } else {
                    isRemind = 'false';
                  }

                  Note updatedNote = Note(id, note, color, isRemind);
                  dbh.updateNote(updatedNote).then((value) {
                    print("Güncelleme Başarılı : " + value.toString());
                  });

                  if (isRemind == 'true') {
                    notificationHelper.showNotification(updatedNote);
                    Toast.show("Created Notification!", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    state.update(updatedNote);
                  } else {
                    notificationHelper.deleteNotification(updatedNote);
                    Toast.show("Deleted Notification!", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  }
                },
                icon: getRemindButton(isRemind),
                color: Colors.black,
              ),
            ],
          ),
          body: Column(
            children: [
              //!Banner Reklam
              // Container(
              //   child: AdWidget(
              //     ad: adsHelper.bannerAd!,
              //   ),
              //   width: adsHelper.bannerAd!.size.width.toDouble(),
              //   height: adsHelper.bannerAd!.size.height.toDouble(),
              //   alignment: Alignment.center,
              // ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Text(
                      note.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  Icon getRemindButton(String isRemind) {
    print("DETAİL SAYFASI İSREMİND => " + isRemind);
    print("DETAİL SAYFASI İSREMİND => " + isRemind.runtimeType.toString());
    var remind = isRemind;
    bool remindBool = remind.toLowerCase() == 'true';
    if (!remindBool) {
      print("??????????????????????????????");
      return Icon(Icons.notifications_off_outlined);
    } else {
      print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      return Icon(Icons.notifications_active_outlined);
    }
  }

  Future<dynamic> onselectedNotification(String payload) async {
    Navigator.of(context).pushNamed(payload);
  }
}
