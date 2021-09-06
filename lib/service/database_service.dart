import 'package:flutter_note/database/database.dart';
import 'package:flutter_note/database/note.dart';

Future<List<Note>> getAllNote() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final noteDao = database.noteDao;
  return await noteDao.findAllNotes();
}

Future<void> addNote(Note note) async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final noteDao = database.noteDao;
  return await noteDao.insertNote(note);
}

Future<void> deleteNotes() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final noteDao = database.noteDao;
  return await noteDao.deleteNotes();
}
