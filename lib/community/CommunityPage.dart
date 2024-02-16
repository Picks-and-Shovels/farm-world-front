// 게시판 메인 페이지

import 'package:farmworld_community/config/mySqlConnector.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:provider/provider.dart';

import 'package:farmworld_community/community/QnAMainPage.dart';
import 'package:farmworld_community/community/postMainPage.dart';
import 'package:farmworld_community/config/mySqlConnector.dart';
import 'package:farmworld_community/community/models/postListProvider.dart';
import 'package:farmworld_community/community/models/communityDB.dart';
import 'package:farmworld_community/community/postDetailPage.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Community',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage()
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

//

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[MyPostPage(), MyQnAPage()],
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
        onPressed: () => addItemEvent(context), // 버튼을 누를 경우 메모 추가 UI 표시
        tooltip: 'Add Item', // 플로팅 액션 버튼 설명
        child: const Icon(Icons.add),
      ),
    );
  }

  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}

//

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

//

class DatabaseApp extends StatefulWidget {
  final Future<Database> db;
  const DatabaseApp(this.db, {super.key});

  @override
  State<StatefulWidget> createState() => _DatabaseApp();
}

class _DatabaseApp extends State<DatabaseApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final community = await Navigator.of(context).pushNamed('/add');
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// 플로팅 액션 버튼을 이용하여 항목을 추가할 제목과 내용
final TextEditingController titleController = TextEditingController();
final TextEditingController contentController = TextEditingController();

Future<void> addItemEvent(BuildContext context) {
  // 다이얼로그 폼 열기
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: contentController,
              maxLines: null, // 다중 라인 허용
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Add'),
            onPressed: () async {
              String title = titleController.text;
              String content = contentController.text;
              // 메모 추가
              await addPost(title, content);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );

}

