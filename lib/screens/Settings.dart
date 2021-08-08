import 'package:camnote/utils/DatebaseHelper.dart';
import 'package:camnote/widgets/SettingsCard/SettingsCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            SettingsCard(
              settingName: "Themes",
              settingIcon: Icon(
                Icons.palette_outlined,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
              toPageName: "/themes",
            ),

            //!Dil Seçenekleri Ayarı
            // Divider(),
            // SettingsCard(
            //   settingName: "Dil Seçenekleri",
            //   settingIcon: Icon(
            //     Icons.translate,
            //     color: Theme.of(context)
            //         .bottomNavigationBarTheme
            //         .unselectedItemColor,
            //   ),
            //   toPageName: "/themes",
            // ),

            //!Paket Satın Al
            // Divider(),
            // SettingsCard(
            //   settingName: "Paket Satın Al",
            //   settingIcon: Icon(
            //     CupertinoIcons.bag,
            //     color: Theme.of(context)
            //         .bottomNavigationBarTheme
            //         .unselectedItemColor,
            //   ),
            //   toPageName: "/themes",
            // ),
            Divider(),
            SettingsCard(
              settingName: "Clear All Data",
              settingIcon: Icon(
                CupertinoIcons.delete,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
              toPageName: "",
              callback: () {
                DatabaseHelper dbh = DatabaseHelper();
                dbh
                    .deleteTable()
                    .then((value) => print("TABLO SİLME SONUCU : ${value}"));
              },
            ),
            // Divider(),
            // SettingsCard(
            //   settingName: "Diğer",
            //   settingIcon: Icon(
            //     CupertinoIcons.settings,
            //     color: Theme.of(context)
            //         .bottomNavigationBarTheme
            //         .unselectedItemColor,
            //   ),
            //   toPageName: "/themes",
            // ),
          ],
        ));
  }
}
