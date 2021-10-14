import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
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
import 'package:loading_animations/loading_animations.dart';
import 'package:camera/camera.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:camera_camera/src/core/camera_bloc.dart';
import 'package:camera_camera/src/core/camera_service.dart';
import 'package:camera_camera/src/core/camera_status.dart';
import 'package:camera_camera/src/presentation/widgets/camera_preview.dart';
import 'package:camera_camera/src/shared/entities/camera_side.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:simple_ocr_plugin/simple_ocr_plugin.dart';

class CameraWrap extends StatefulWidget {
  const CameraWrap({Key? key}) : super(key: key);

  @override
  _CameraWrapState createState() => _CameraWrapState();
}

class _CameraWrapState extends State<CameraWrap> {
  @override
  Widget build(BuildContext context) {
    String path = "";
    String result = "";
    String sonuc = "";
    String content = "";
    bool isShowBottoSheet = false;
    BuildContext dialogContext;
    return Scaffold(
      body: CameraCamera(
        onFile: (file) async {
          path = file.path;
          print("Dosya Yolu : ${file.path.toString()}");

          SimpleOcrPlugin.performOCR(file.path).then((response) {
            isShowBottoSheet = false;
            Navigator.of(context).pushNamed("/result",
                arguments: clearResult(response.toString()));
          });

          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              isScrollControlled: true,
              builder: (context) {
                dialogContext = context;
                return Container(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.45,
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
                            child: Column(
                              children: [
                                LoadingBouncingGrid.circle(
                                  size: 60,
                                  borderColor: Colors.greenAccent,
                                  backgroundColor: Colors.greenAccent,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 35),
                                  child: Center(
                                    child: Text(
                                        "This process may take a while..",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    decoration: new BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                  ),
                );
              });

          // final myIsolate = await optimizedOcr({
          //   "imagePath": file.path,
          //   "language": "tur+eng",
          //   "result": content,
          //   "sendPort": port.sendPort,
          // });

          //TODO:Bottom Sheet

          //TODO: Burada Ocr çalışacak

          //TODO: Ocr Sonucundan sonra da sonuç alttan gelen bir menü ile gösterilecek. Eğer kaydete basarsa kaydetip geri gidecek.
        },
      ),
    );
  }

  String clearResult(String content) {
    print(
        "##################################################################################################");
    print(content);
    print(
        "##################################################################################################");

    //{ "code": 200, "text": "LISKANLIKLARIN Güct ST SEERER 0ZEL VE is HAYATMIZDA DAVRANISLARIMIZIN ARDINDA NELER YATAR? Charles Duhigg", "blocks": 5 }
    var result = content.replaceAll('{ "code": 200, "text": "', '');

    result = result.replaceAll('", "blocks": ', '<');

    result = result.replaceAll(' }', '>');

    var blockCount =
        result.substring(result.indexOf('<') + 1, result.indexOf('>'));

    result = result.replaceAll('<' + blockCount + '>', '');

    print(
        "-------------------------------------------------------------------------------------");

    print(result);

    print(
        ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    // ignore: avoid_print
    print(blockCount);

    return result;
  }
}
