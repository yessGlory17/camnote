import 'package:camera_camera/camera_camera.dart';
import 'package:camnote/screens/Detail.dart';
import 'package:camnote/screens/Home.dart';
import 'package:camnote/screens/New.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

import 'dart:io';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    String content;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => Home());

      case "/detail":
        return MaterialPageRoute(
            builder: (context) => Detail(), settings: settings);

      case "/new":
        return MaterialPageRoute(
            builder: (context) => CameraCamera(
                  onFile: (file) {
                    //When take foto you should close camera
                    //Navigator.pop(context);
                    //setState(() {});
                    print("Dosya Yolu : ${file.path.toString()}");

                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (BuildContext context) {
                    //   return New(file: file);
                    // }));
                    FlutterTesseractOcr.extractText(
                      file.path,
                      language: "eng+tur",
                    ).then((value) {
                      print("SONUC : " + value);
                      content = value;

                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.75,
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    // Image.file(
                                    //   file,
                                    //   width: 300,
                                    //   height: 300,
                                    // ),
                                    Container(
                                      height: 100,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 30),
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        child: SelectableText(
                                          (content == '')
                                              ? content = "Yükleniyor..."
                                              : content,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(25.0),
                                    topRight: const Radius.circular(25.0),
                                  ),
                                ),
                              ),
                            );
                          });
                    });

                    //TODO:Bottom Sheet

                    //TODO: Burada Ocr çalışacak

                    //TODO: Ocr Sonucundan sonra da sonuç alttan gelen bir menü ile gösterilecek. Eğer kaydete basarsa kaydetip geri gidecek.
                  },
                ));

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
