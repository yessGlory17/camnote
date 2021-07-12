import 'package:camnote/models/Note.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var note = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          actions: [
            //Remove Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_outline),
                color: Colors.black,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff64646F).withOpacity(0.3),
                    spreadRadius: 0.5,
                    blurRadius: 10,
                    offset: Offset(0, .5), // changes position of shadow
                  ),
                ],
              ),
            ),

            //Reminder Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_active_outlined),
                color: Colors.black,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff64646F).withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, .5), // changes position of shadow
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Text(
              note.toString(),
              style: TextStyle(fontSize: 18),
            ),
          )),
    );
  }
}
