import 'package:farmworld_2/community.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:farmworld_2/community/general.dart';
import 'package:farmworld_2/community/QnA.dart';
import './listItem.dart';
import 'community.dart';
import 'addCommunity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<Database> database = initDatabase();

    return MaterialApp(
      title: 'Community',
      theme: ThemeData(
        primarySwatch: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/data':(context) => DatabaseApp(database),
        '/add': (context) => AddCommunityApp(database)
      },
    );
  }

  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'community_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE communities(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title TEXT, context TEXT, name TEXT)",
        );
      },
      version: 1,
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage>
  with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[general(list: postList), const QnA()],
      ),
      bottomNavigationBar: TabBar(
        tabs: const <Tab>[
          Tab(
            icon: Icon(Icons.looks_one, color: Colors.blue),
          ),
          Tab(
            icon: Icon(Icons.looks_two, color: Colors.blue),
          )
        ],
        controller: controller,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/second');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  TabController? controller;
  List<post> postList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    // postList를 추가한 initState() 함수
    postList.add(post(Name: "벌", kind: "곤충",
    imagePath: ));
    // 위 error는 입력값 기입 시 해결됨
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Q&A'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Back'),
          ),
        ),
      ),
    );
  }
}

class DatabaseApp extends StatefulWidget {
  final Future<Database> db;
  const DatabaseApp(this.db, {super.key});

  const DatabaseApp({super.key});

  @override
  State<StatefulWidget> createState() => _DatabaseApp();
}

class _DatabaseApp extends State<DatabaseApp> {
  Future<List<Community>>? communityList;

  @override
  void initState() {
    super.initState();
    communityList = getCommunity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Database Example'),),
      body: Container(
        child: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const CircularProgressIndicator();
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                  return const CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        Community community = (snapshot.data as List<Community>)[index];
                        return Card(
                          child: Column(
                            children: <Widget>[
                              Text(community.title!),
                              Text(community.content!),
                            ],
                          ),
                        );
                      },
                      itemCount: (snapshot.data as List<Community>).length,
                    );
                  } else {
                    return const Text('No data');
                  }
              }
              return const CircularProgressIndicator();
              },
              future: communityList,
          ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final community = await Navigator.of(context).pushNamed('/add');
          if (community != null) {
            _insertCommunity(community as Community);
          }
        },
        child: const Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }

  void _insertCommunity(Community community) async {
    final Database database = await widget.db;
    await database.insert('communities', community.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
    setState(() {
      communityList = getCommunity();
    });
  }

  Future<List<Community>> getCommunity() async {
    final Database database = await widget.db;
    final List<Map<String, dynamic>> maps = await database.query('communities');

    return List.generate(maps.length, (i) {
      return Community(
        title: maps[i]['title'].toString(),
        content: maps[i]['content'].toString(),
        id: maps[i]['id']);
  });
    }
  }

