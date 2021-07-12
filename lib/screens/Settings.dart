import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.translate),
            title: Text("Dil Ayarları"),
            trailing: Icon(CupertinoIcons.forward),
            onTap: () {},
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text("Tema Ayarları"),
            trailing: Icon(CupertinoIcons.forward),
            onTap: () {},
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text("Paket Satın Al"),
            trailing: Icon(CupertinoIcons.forward),
            onTap: () {},
          ),
        )
      ],
    ));
  }
}
