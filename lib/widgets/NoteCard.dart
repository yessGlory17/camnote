import 'package:camnote/models/Note.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  int id;
  String note;
  Color color;
  String date;
  String remind;
  NoteCard(this.id, this.date, this.remind,
      {this.note = "", this.color = Colors.orangeAccent});

  @override
  Widget build(BuildContext context) {
    //var formattedDay = formatDate(date, [dd, ' ', M, ' ', yyyy]);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/detail", arguments: {
          'note': this.note,
          'id': this.id,
          'color': this.color,
          'date': this.date,
          'remind': this.remind
        });
      },
      child: Container(
        width: 300,
        height: 600,
        child: Container(
            width: 200,
            height: 500,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  this.note,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Spacer(),
                Container(
                  width: 200,
                  child: Text(
                    date, //formattedDay,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF8B8B8B), fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Color(0xff64646F).withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, .5), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
