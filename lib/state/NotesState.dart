import 'package:camnote/models/Note.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

String testContent =
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.";

class NotesState with ChangeNotifier {
  List<Note> notes = [
    Note(testContent, Color(0xFFFFAB91), DateTime(2021, 9, 7, 17, 30)),
    Note(testContent, Color(0xFFFFCC80), DateTime(2021, 10, 11, 17, 30)),
    Note(testContent, Color(0xFFE6EE9B), DateTime(2021, 11, 18, 17, 30)),
    Note(testContent, Color(0xFF80DEEA), DateTime(2021, 12, 2, 17, 30)),
    Note(testContent, Color(0xFFCF93D9), DateTime(2021, 10, 10, 17, 30)),
    Note(testContent, Color(0xFFFFAB91), DateTime(2021, 9, 7, 17, 30)),
    Note(testContent, Color(0xFFFFCC80), DateTime(2021, 10, 11, 17, 30)),
    Note(testContent, Color(0xFFE6EE9B), DateTime(2021, 11, 18, 17, 30)),
    Note(testContent, Color(0xFF80DEEA), DateTime(2021, 12, 2, 17, 30)),
    Note(testContent, Color(0xFFCF93D9), DateTime(2021, 10, 10, 17, 30)),
    Note(testContent, Color(0xFFFFAB91), DateTime(2021, 9, 7, 17, 30)),
    Note(testContent, Color(0xFFFFCC80), DateTime(2021, 10, 11, 17, 30)),
    Note(testContent, Color(0xFFE6EE9B), DateTime(2021, 11, 18, 17, 30)),
    Note(testContent, Color(0xFF80DEEA), DateTime(2021, 12, 2, 17, 30)),
    Note(testContent, Color(0xFFCF93D9), DateTime(2021, 10, 10, 17, 30)),
    Note(testContent, Color(0xFFFFAB91), DateTime(2021, 9, 7, 17, 30)),
    Note(testContent, Color(0xFFFFCC80), DateTime(2021, 10, 11, 17, 30)),
    Note(testContent, Color(0xFFE6EE9B), DateTime(2021, 11, 18, 17, 30)),
    Note(testContent, Color(0xFF80DEEA), DateTime(2021, 12, 2, 17, 30)),
    Note(testContent, Color(0xFFCF93D9), DateTime(2021, 10, 10, 17, 30)),
    Note(testContent, Color(0xFFFFAB91), DateTime(2021, 9, 7, 17, 30)),
    Note(testContent, Color(0xFFFFCC80), DateTime(2021, 10, 11, 17, 30)),
    Note(testContent, Color(0xFFE6EE9B), DateTime(2021, 11, 18, 17, 30)),
    Note(testContent, Color(0xFF80DEEA), DateTime(2021, 12, 2, 17, 30)),
    Note(testContent, Color(0xFFCF93D9), DateTime(2021, 10, 10, 17, 30)),
    Note(testContent, Color(0xFFFFAB91), DateTime(2021, 9, 7, 17, 30)),
    Note(testContent, Color(0xFFFFCC80), DateTime(2021, 10, 11, 17, 30)),
    Note(testContent, Color(0xFFE6EE9B), DateTime(2021, 11, 18, 17, 30)),
    Note(testContent, Color(0xFF80DEEA), DateTime(2021, 12, 2, 17, 30)),
    Note(testContent, Color(0xFFCF93D9), DateTime(2021, 10, 10, 17, 30)),
  ];

  List<Note> getNotes() {
    return notes;
  }

  add(Note note) {
    notes.add(note);
    notifyListeners();
  }
}
