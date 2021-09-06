import 'package:floor/floor.dart';

@entity
class Note {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final String text;
  final String date;
  final String color;

  Note(
    this.id,
    this.title,
    this.text,
    this.date,
    this.color,
  );
}
