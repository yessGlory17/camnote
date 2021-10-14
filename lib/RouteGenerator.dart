import 'package:camera_camera/camera_camera.dart';
import 'package:camnote/screens/CameraWrap.dart';
import 'package:camnote/screens/Detail.dart';
import 'package:camnote/screens/Home.dart';
import 'package:camnote/screens/New.dart';
import 'package:camnote/screens/ResultPage.dart';
import 'package:camnote/screens/Themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:camnote/widgets/ResultBottomSheet.dart';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:path/path.dart';
import 'package:simple_ocr_plugin/simple_ocr_plugin.dart';

class RouteGenerator {
  static String path = "";
  static String sonuc = "";
  static String content = "";
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    // String content = "";
    Isolate isolate;
    bool show = true;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => Home());

      case "/detail":
        return MaterialPageRoute(
            builder: (context) => Detail(), settings: settings);

      case "/new":
        return MaterialPageRoute(builder: (context) => CameraWrap());
      case "/result":
        return MaterialPageRoute(
            builder: (context) => ResultPage(), settings: settings);

      case "/themes":
        return MaterialPageRoute(builder: (context) => Themes());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text("404"),
                  ),
                ));
    }
  }
}

// Widget control() {
//   while (extractedResult.extractedRes == "") {
//     return Center(child: LoadingFlipping.circle());
//   }

//   return SelectableText(
//     RouteGenerator.content,
//     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//   );
// }
