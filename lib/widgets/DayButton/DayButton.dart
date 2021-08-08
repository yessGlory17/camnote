import 'package:camnote/models/ButtonState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayButton extends StatefulWidget {
  const DayButton({Key? key}) : super(key: key);

  @override
  _DayButtonState createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  @override
  Widget build(BuildContext context) {
    ButtonState buttonState = ButtonState.deactive;
    Color buttonColor = Colors.grey.withOpacity(.6);
    return GestureDetector(
      onTap: () {
        if (buttonState == ButtonState.deactive) {
          buttonState = ButtonState.active;
          setState(() {
            buttonColor = Colors.greenAccent;
          });
        } else {
          buttonState = ButtonState.active;
          setState(() {
            buttonColor = Colors.grey.withOpacity(.6);
          });
        }
      },
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), color: buttonColor),
      ),
    );
  }
}
