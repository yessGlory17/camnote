import 'package:camnote/models/Note.dart';
import 'package:camnote/state/NotesState.dart';
import 'package:camnote/utils/DatebaseHelper.dart';
import 'package:camnote/widgets/NoteCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camnote/state/NotesState.dart';

class NoteGrid extends StatefulWidget {
  const NoteGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteGrid> createState() => _NoteGridState();
}

class _NoteGridState extends State<NoteGrid> {
  DatabaseHelper dbh = DatabaseHelper();
  List<Note> noteList = [];

  @override
  void initState() {
    print("NoteList Length : " + noteList.length.toString());
    // TODO: implement initState
    super.initState();
    var notes = dbh.allNotes().then((allNoteMapList) {
      for (Map note in allNoteMapList) {
        var element = Note.toObject(note);
        noteList.add(element);
        print("Eklendi!  " + noteList.length.toString());
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesState>(
      builder: (context, state, widget) {
        if (noteList.length != 0) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 25.0,
              childAspectRatio: 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              Note currentNote = noteList[index];

              return NoteCard(
                currentNote.id,
                currentNote.date,
                currentNote.remind,
                note: currentNote.note,
                color: currentNote.color,
              );
            },
            itemCount: noteList.length, //state.notes.length,
          );
        } else {
          return Center(
            child: Text("Empty! Create A Note"),
          );
        }
      },
    );
  }
}
