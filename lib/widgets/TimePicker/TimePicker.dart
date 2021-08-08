import 'dart:ffi';

import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  int currentSliderValueHour = 0;
  double sliderValueHour = 0.0;

  int currentSliderValueSecond = 0;
  double sliderValueSecond = 0.0;

  bool showHourSlider = true;
  bool showSecondSlider = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 280,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showSecondSlider = false;
                        showHourSlider = true;
                      });
                    },
                    child: TimeViewer(
                      currentTime: this.currentSliderValueHour,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showSecondSlider = true;
                        showHourSlider = false;
                      });
                    },
                    child: TimeViewer(
                      currentTime: this.currentSliderValueSecond,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: showHourSlider,
              child: Slider(
                  min: 0,
                  max: 24,
                  divisions: 24,
                  label: sliderValueHour.round().toString(),
                  value: sliderValueHour,
                  activeColor: Colors.greenAccent,
                  onChanged: (value) {
                    setState(() {
                      sliderValueHour = value;
                      currentSliderValueHour = sliderValueHour.toInt();
                    });
                  }),
            ),
            Visibility(
              visible: showSecondSlider,
              child: Slider(
                  min: 0.0,
                  max: 59.0,
                  divisions: 12,
                  label: sliderValueSecond.round().toString(),
                  value: sliderValueSecond,
                  activeColor: Colors.greenAccent,
                  onChanged: (value) {
                    setState(() {
                      sliderValueSecond = value;
                      currentSliderValueSecond = sliderValueSecond.toInt();
                    });
                  }),
            ),
            TextButton(
              onPressed: () {
                String resultHour = currentSliderValueHour.toString() +
                    ':' +
                    currentSliderValueSecond.toString();
                print("AYARLANAN SAAT ${resultHour} ");
              },
              child:
                  Text("Kaydet", style: TextStyle(color: Colors.greenAccent)),
            )
          ],
        ),
      ),
    );
  }
}

class TimeViewer extends StatefulWidget {
  int currentTime = 0;
  TimeViewer({Key? key, this.currentTime = 0}) : super(key: key);

  @override
  _TimeViewerState createState() => _TimeViewerState();
}

class _TimeViewerState extends State<TimeViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 75,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Color(0xFFf1f2f6).withOpacity(.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(widget.currentTime.toString(),
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: _colorControl(),
              ))),
    );
  }

  Color _colorControl() {
    List<Color> controlColors = [
      Colors.white,
    ];

    for (Color color in controlColors) {
      if (color == Theme.of(context).scaffoldBackgroundColor) {
        return Colors.black;
      }
    }

    return Theme.of(context).scaffoldBackgroundColor;
  }
}
