import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  Icon settingIcon;
  String settingName;
  String toPageName;
  Color cardColor;
  Function? callback;
  SettingsCard(
      {Key? key,
      required this.settingName,
      required this.settingIcon,
      required this.toPageName,
      Function? this.callback,
      this.cardColor = Colors.indigo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.toPageName == "") {
          this.callback!();
        } else {
          Navigator.of(context).pushNamed(this.toPageName);
        }
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            //color: this.cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: this.settingIcon,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  this.settingName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
