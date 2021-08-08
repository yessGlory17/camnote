import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:camnote/models/Note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper = DatabaseHelper._internal();
  static Database? _database;

  String notesTable = "notes";
  String columnID = 'id';
  String columnNote = 'note';
  String columnColor = 'color';
  String columnDate = 'date';
  String columnRemind = 'remind';

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  // =>_database ??= await _initiateDatabase();
  Future<Database> get _getDatabase async =>
      _database ??= await _initializeDatabase();

  Future<Database> _initializeDatabase() async {
    Directory file = await getApplicationDocumentsDirectory();
    String dbPath = join(file.path, "notes.db");
    var notesDB = openDatabase(dbPath, version: 1, onCreate: _createDB);
    return notesDB;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $notesTable ($columnID INTEGER PRIMARY KEY, $columnNote TEXT, $columnColor TEXT, $columnDate TEXT, $columnRemind TEXT )");
  }

  Future<int> addNote(Note note) async {
    var db = await _getDatabase;
    var result =
        await db.insert(notesTable, note.toMap(), nullColumnHack: "$columnID");
    return result;
  }

  Future<int> deleteNote(int id) async {
    var db = await _getDatabase;
    var result =
        await db.delete(notesTable, where: '$columnID = ?', whereArgs: [id]);
    return result;
  }

  Future<List<Map<String, dynamic>>> allNotes() async {
    var db = await _getDatabase;
    var result = await db.query(notesTable, orderBy: '$columnID DESC');

    return result;
  }

  Future<int> updateNote(Note note) async {
    var db = await _getDatabase;
    var result = await db.update(notesTable, note.toMap(),
        where: '$columnID = ?', whereArgs: [note.id]);
    return result;
  }

  Future<int> deleteTable() async {
    var db = await _getDatabase;
    var result = await db.delete(notesTable);
    return result;
  }
}
