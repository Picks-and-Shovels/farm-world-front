// 일지 작성 페이지
// 달력 페이지의 날짜를 클릭하면 해당 페이지로 이동

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:mysql_client/mysql_client.dart';

import 'package:farmworld_community/diary/config/dbInfo.dart';
import 'package:farmworld_community/diary/config/mySqlConnector.dart';
import 'package:farmworld_community/diary/models/diary_db.dart';

class DiaryPage extends StatefulWidget {
  final dynamic content;
  final DateTime selectedDate;

  const DiaryPage({
    required this.selectedDate, this.content,
    Key? key,
  }) : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState(content: content);
}

class _DiaryPageState extends State<DiaryPage> {

  final dynamic content;

  _DiaryPageState({required this.content});

  List diaryInfo = [];

  late DateTime date;

  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    date = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // _showConfirmationDialog(context, date);
              print('Delete button pressed');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
            ElevatedButton(
              child: Text("${_formattedDate(date)}"),
              onPressed: () {
                _selectDate(context);
              },
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // _buiildDiaryEntries(),
                  ElevatedButton(
                    onPressed: () {
                      // _saveDiaryEntry(date);
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  ///

  String _formattedDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      setState(() {
        date = selectedDate;
      });
    }
  }

  Future<Widget> _buildDiaryEntries() async {
    final conn = await dbConnector();

    List diaryList = [];

    // DB에서 게시물 정보 호출
    var result = await selectPost(content['date']);

    // 특정 게시물 정보 저장
    for (final row in result!.rows) {
      var post = {
        'id': row.colByName('id'),
        'date': row.colByName('date'),
        'userName': row.colByName('userName'),
        'postTitle': row.colByName('postTitle'),
        'postContent': row.colByName('postContent'),
        'createDate': row.colByName('createDate'),
        'updateDate': row.colByName('updateDate')
      };
      diaryList.add(post);
    }

    return Expanded(
        child: Builder(
          builder: (context) {
            if (diaryList.isEmpty) {
              return TextFormField(
                controller: contentController,
                keyboardType: TextInputType.multiline,
                maxLines: 25,
                decoration: InputDecoration(
                    hintText: '입력해주세요'
                ),
              );
            } else {
              return TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 25,
                decoration: InputDecoration(
                  hintText: '입력해주세요',
                ),
                onChanged: (text){diaryList.last.content = text;},
              );
            }
          },
        )
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context,
      DateTime date) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 확인'),
          content: Text('일지를 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),

            TextButton(
              onPressed: () {
                deletePost(diaryInfo[0]['date']);
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );

    Future<void> updateItemEvent(BuildContext context, DateTime date) {
      TextEditingController contentController =
      TextEditingController(text: diaryInfo[0]['diaryContent']);

      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('삭제 확인'),
            content: Text('일지를 삭제하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('취소'),
              ),

              TextButton(
                onPressed: () {
                  deletePost(diaryInfo[0]['date']);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }

    Future<void> _selectDate(BuildContext context) async {
      final selectedDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
      );
      if (selectedDate != null) {
        setState(() {
          date = selectedDate;
        });
      }
    }
  }
}