import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'community.dart';

class AddCommunityApp extends StatefulWidget {
  final Future<Database> db;
  const AddCommunityApp(this.db, {super.key});

  @override
  State<StatefulWidget> createState() => _AddCommunityApp();
}

class _AddCommunityApp extends State<AddCommunityApp> {
  TextEditingController? titleController;
  TextEditingController? contextController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: Container(
        child: const Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10)
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'title'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: contentController,
                  decoration: InputDecoration(labelText:'content'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Community community = Community(
                    title: titleController!.value.text,
                    content: contextController!.value.text,
                    active: 0);
                    Navigator.of(content).pop(community);
                },
                child: Text('upload'),
                )
            ],
          ),
        ),
      ),
    );
  }
}
