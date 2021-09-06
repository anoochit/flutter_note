//import 'dart:developer' as debug;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_note/const/color.dart';
import 'package:flutter_note/database/note.dart';
import 'package:flutter_note/service/database_service.dart';

class CreateNote extends StatefulWidget {
  CreateNote({Key? key}) : super(key: key);

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if ((title.text.isNotEmpty) && (note.text.isNotEmpty)) {
          Random random = new Random();
          int result = random.nextInt(6);
          Note noteItem = Note(null, title.text, note.text, DateTime.now().toString(), listColor[result]);

          addNote(noteItem);

          return true;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              TextFormField(
                controller: title,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title...',
                ),
              ),
              TextFormField(
                controller: note,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note...',
                ),
                minLines: 1,
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
