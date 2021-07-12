import 'package:camera/camera.dart';
import 'package:camnote/main.dart';
import 'package:flutter/cupertino.dart';

class CameraState with ChangeNotifier {
  List<CameraDescription> cameras = [];

  CameraState(this.cameras);

  void addCamera(CameraDescription camera) {
    cameras.add(camera);
    notifyListeners();
  }
}
