import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_note/database/note.dart';
import 'package:flutter_note/service/database_service.dart';
import 'package:flutter_note/utils/utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //deleteNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
      ),
      body: FutureBuilder(
        future: getAllNote(),
        builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          }

          if (snapshot.hasData) {
            var notes = snapshot.data;
            return StaggeredGridView.countBuilder(
              itemCount: notes!.length,
              crossAxisCount: 4,
              itemBuilder: (context, index) {
                Color color = HexColor(notes[index].color);
                log(notes[index].text);
                return Card(
                  color: color,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            notes[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Text(
                          notes[index].text,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) => new StaggeredTile.count(2, (notes[index].text.length > 20) ? 2 : 1),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/create').then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
