import 'package:flutter/material.dart';

Future<T?> ResultBottomSheet<T>(String content, context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
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
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: SelectableText(
                      (content == '') ? content = "Yükleniyor..." : content,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
}
