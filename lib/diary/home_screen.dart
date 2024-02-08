import 'package:farmworld_community/diary/DiaryPage.dart';
import 'package:flutter/material.dart';

import 'package:farmworld_community/diary/CalendarPage.dart';

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({Key? key}) : super(key:key);

  @override
  State<MyDiaryScreen> createState() => _MyCalendarScreenState();
}

class _MyCalendarScreenState extends State<MyDiaryScreen> {
  // 선택된 날짜를 저장
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build (BuildContext context) {
    // 현재 디바이스의 스크린 너비와 높이 값을 가져옴
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // 화면 구조
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('menu button is clicked');
            },
          ),
          title: Text('Diary')
      ),
      body: Center(
          child: SizedBox(
              width: screenWidth * 0.9, height: screenHeight * 0.7,
              child: MainCalendar(
                // MainCalendar에 현재 선택된 날짜 전달
                selectedDate: selectedDate,
                // MainCalendar에서 날짜 선택 시 호출될 콜백 함수 설정
                onDaySelected: onDaySelected,
              )
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (_) => DiarySheet(selectedDate: selectedDate)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // MainCalendaar에서 호출되는 콜백 함수 (선택된 날짜 업데이트)
  void onDaySelected (DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
