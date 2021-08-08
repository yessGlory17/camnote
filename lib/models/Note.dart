import 'package:camnote/models/Days.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:intl/intl.dart';

class Note {
  int id = 0;
  String note = '';
  Color color = Colors.greenAccent;
  String date = DateFormat.yMMMMd('en_US').format(DateTime.now());
  String remind = 'false';
  // final bool isRemind;
  // final List<Days> remindDays;
  Note(this.id, this.note, this.color, this.remind);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = this.id;
    map['note'] = this.note;
    map['color'] = this.color.toString().split('(0x')[1].split(')')[0];
    map['date'] = this.date.toString();
    map['remind'] = this.remind.toString();

    return map;
  }

  Note.toObject(Map<dynamic, dynamic> map) {
    this.id = map['id'];
    this.note = map['note'].toString();
    this.color = Color(int.parse(map['color'], radix: 16));
    this.date = map['date'];
    this.remind = map['remind'].toString();
  }
}
