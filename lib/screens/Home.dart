import 'package:camnote/models/Note.dart';
import 'package:camnote/screens/Settings.dart';
import 'package:camnote/state/NotesState.dart';
import 'package:camnote/widgets/NoteCard.dart';
import 'package:camnote/widgets/NoteGrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camnote/screens/New.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [];
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();

    //pages = [NoteGrid(), New(), Settings()];
    pages.add(NoteGrid());
    //pages.add(New());
    pages.add(Settings());
    pages.add(Settings());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          print("*******************");
          setState(() {
            if (index == 1) {
              Navigator.of(context).pushNamed("/new");
            } else {
              selectedIndex = index;
            }

            print("Navigasyon çalıştı ${selectedIndex}");
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: "Notlar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Yeni",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Ayarlar",
          ),
        ],
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey.withOpacity(0.6),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Notes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 110),
                alignment: Alignment.topRight,
                width: 110,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Dark Mode Button
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.dark_mode,
                          color: Colors.black,
                        )),

                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          )),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff64646F).withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, .5), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
