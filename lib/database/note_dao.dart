import 'package:floor/floor.dart';
import 'package:flutter_note/database/note.dart';

@dao
abstract class NoteDao {
  @Query('SELECT * FROM Note ORDER BY date DESC')
  Future<List<Note>> findAllNotes();

  @Query('SELECT * FROM Note WHERE id = :id')
  Stream<Note?> findNoteById(int id);

  @insert
  Future<void> insertNote(Note note);

  @Query('DELETE FROM Note')
  Future<void> deleteNotes();
}
