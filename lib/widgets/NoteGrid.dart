import 'package:camnote/models/Note.dart';
import 'package:camnote/state/NotesState.dart';
import 'package:camnote/widgets/NoteCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteGrid extends StatelessWidget {
  const NoteGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesState>(
      builder: (context, state, widget) {
        List<Note> noteList = state.notes;

        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
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
              currentNote.date,
              note: currentNote.note,
              color: currentNote.color,
            );
          },
          itemCount: state.notes.length,
        );
      },
    );
  }
}
