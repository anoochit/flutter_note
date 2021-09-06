import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_note/database/note_dao.dart';
import 'package:flutter_note/database/note.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Note])
abstract class AppDatabase extends FloorDatabase {
  NoteDao get noteDao;
}
