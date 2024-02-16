import 'package:flutter/material.dart';
import 'package:farmworld_community/config/mySqlConnector.dart';
import 'package:farmworld_community/loginPage/loginMainPage.dart';


import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:provider/provider.dart';

import 'package:farmworld_community/config/mySqlConnector.dart';
import 'package:farmworld_community/community/models/postListProvider.dart';
import 'package:farmworld_community/community/models/communityDB.dart';

void main() {
  dbConnector();
  runApp(MyApp());

  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PostUpdator()),
    ],
    child: const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm World',
      home: TokenCheck(),
    );
  }
}