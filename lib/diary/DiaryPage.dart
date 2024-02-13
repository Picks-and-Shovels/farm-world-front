import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:farmworld_community/diary/models/diary_db.dart';

class DiarySheet extends StatefulWidget {
  final DateTime selectedDate;

  const DiarySheet({
    required this.selectedDate,
    Key? key,
  }) : super(key: key);

  @override
  State<DiarySheet> createState() => _DiarySheetState();
}
// 입력값 저장
class _DiarySheetState extends State<DiarySheet> {
  late DateTime date;
// 텍스트 입력을 관리하는 TextEditingController 인스턴스 변수 선언
  TextEditingController contentController = TextEditingController();

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
              _showConfirmationDialog(context, date);
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
            // 날짜별 데이터 유무에 따라 위젯이 다르게 보여야 함
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildDiaryEntries(),
                  ElevatedButton(
                    onPressed: () {
                      _saveDiaryEntry(date);
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

  // Firebase
  // 'GetIt.I().watchSchedules(date)' -> DB값을 조회
  // 데이터가 비어 있는 경우, 'TextFormField' 위젯을 그대로 반환
  // 데이터가 있는 경우, 생성일자로 정렬하고 최근값(diaryDataList.last.content)을 가져옴
  Widget _buildDiaryEntries() {
    // StreamBuilder를 사용하여 일기 데이터의 변화를 감지하고 업데이트하는 위젯을 반환
    // Firestore에서 'diary' 컬렉션의 데이터를 스트림으로 가져옴
    return StreamBuilder<List<DiaryDbData>>(
      // watchSchedules(date)로부터 반환된 일기 데이터의 stream 감지
      stream: GetIt.I<LocalDatabase>().watchSchedules(date),
      builder: (context, snapshot) {
        // 데이터 로딩 중일 때
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state
          // 로딩 상태를 나타내는 'CircularProgressIndicator' 반환
          return CircularProgressIndicator();
          // 데이터 로딩이나 에러가 없을 때
        } else if (snapshot.hasError) {
          // Error state
          // 에러 상태를 나타내는 텍스트 반환
          return Text('Error: ${snapshot.error}');
          // 데이터가 성공적으로 로딩되었을 때
        } else {
          // Data loaded successfully
          // 로드된 일기 데이터 목록을 가져옴
          final diaryDataList = snapshot.data ?? [];
          // 데이터를 생성 일자로 정렬
          diaryDataList.sort((a, b) => a.create.compareTo(b.create));

          for (var i in diaryDataList) {
            print(i);
          }
          // 일기 데이터가 비어 있는 경우
          if (diaryDataList.isEmpty) {
            // 'TextFormField'를 반환하고, 텍스트 입력
            return TextFormField(
              controller: contentController,
              keyboardType: TextInputType.multiline,
              maxLines: 25,
              decoration: InputDecoration(
                hintText: '입력해주세요.',
                // Display hintText only if there are no entries
              ),
            );
            // 일기 데이터가 존재하는 경우
          } else {
            // 마지막 내용으로 초기화된 'TextFormField'를 반환
            return TextFormField(
              controller: getControllerText(diaryDataList.last.content),
              keyboardType: TextInputType.multiline,
              maxLines: 25,
              decoration: InputDecoration(
                hintText: '입력해주세요.',
                // Display hintText only if there are no entries
              ),
            );
          }
        }
      },
    );
  }

      //

  Widget _buildDiaryEntries() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('diary')
          .where('date',
          isEqualTo: DateFormat('yyyy-MM-dd').format(
              date)) // Adjust this condition based on your data model
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Error state
          return Text('Error: ${snapshot.error}');
        } else {
          // Data loaded successfully
          final diaryDataList = snapshot.data!.docs
              .map(
                (QueryDocumentSnapshot e) => DiaryModel.fromJson(
                json: (e.data() as Map<String, dynamic>)),
          )
              .toList();

          diaryDataList.sort((a, b) => a.create.compareTo(b.create));

          if (diaryDataList.isEmpty) {
            return TextFormField(
              controller: contentController,
              keyboardType: TextInputType.multiline,
              maxLines: 25,
              decoration: InputDecoration(
                hintText: '입력해주세요.',
                // Display hintText only if there are no entries
              ),
            );
          } else {
            return TextFormField(
              controller: getControllerText(diaryDataList.last.content),
              keyboardType: TextInputType.multiline,
              maxLines: 25,
              decoration: InputDecoration(
                hintText: '입력해주세요.',
                // Display hintText only if there are no entries
              ),
            );
          }
        }
      },
    );
  }

  // 데이터베이스 연동 기능
  // GetIt 패키지를 사용하여 로컬 데이터베이스에 contentController.text 값 저장
  void _saveDiaryEntry(DateTime date) async {
    try {
      await GetIt.I<LocalDatabase>().removeSchedule(date);
      //새로운 값 생성
      await GetIt.I<LocalDatabase>().createSchedule(
        DiaryDbCompanion(
            content: Value(contentController.text), // 날짜별 내용
            date: Value(date), //선택한 날짜
            create: Value(DateTime.now())), // 생성 일자
      );

      // Firbase
      // 새로운 DiaryModel 인스턴스 생성
      var diary = DiaryModel(
        id: Uuid().v4(),
        content: contentController.text,
        date: date,
        create: DateTime.now(),
      );
      print(contentController.text);
      await FirebaseFirestore.instance
          .collection(
        'diary',
      )
          .doc(diary.id)
          .set(diary.toJson());

      print('Diary entry saved successfully.'); // 저장 성공 시 메시지 출력
    } catch (e) {
      print('Failed to save diary entry: $e'); // 저장 실패 시 메시지 출력
    }
  }
      //

  Future<void> _showConfirmationDialog(
      BuildContext context, DateTime date) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 확인'),
          content: Text('일정을 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                // 취소 버튼 클릭 시, 알림창 닫기만 수행
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                // 확인 버튼 클릭 시, 일정 삭제 후 알림창 닫기와 뒤로 가기 수행
                // GetIt.I<LocalDatabase>().removeSchedule(date);
                deleteDiaryEntriesByDate(date);
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

  // 주어진 텍스트로 초기화된 'TextEditingController'를 반환하는 함수
  TextEditingController getControllerText(text) {
    // 'TextEditingController'를 생성하고 주어진 텍스트로 초기화
    contentController = TextEditingController(text: text);
    // 초기화된 'TextEditingController'를 반환
    return contentController;
  }

  String _formattedDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // Firebase
  Future<void> deleteDiaryEntriesByDate(DateTime date) async {
    try {
      // Firestore에서 특정 날짜에 해당하는 데이터들을 가져오는 쿼리
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('diary')
          .where('date', isEqualTo: DateFormat('yyyy-MM-dd').format(date))
          .get();

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        await document.reference.delete();
      }

      print('Diary entries deleted successfully.');
    } catch (e) {
      print('Failed to delete diary entries: $e');
    }
  }
}
  //