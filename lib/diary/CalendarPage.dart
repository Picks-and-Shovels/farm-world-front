// 일지 달력 페이지

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:farmworld_community/diary/DiaryPage.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  MainCalendar({
    required this.onDaySelected,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    // TableCalendar 위젯을 사용해 달력 표시
    return TableCalendar(
      // 날짜가 선택되었을 때 호출되는 함수 설정
      onDaySelected: (selectedDate, focusedDate) {
        // DiarySheet 화면으로 이동하는 내비게이션을 수행
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DiaryPage(selectedDate: selectedDate),
          ),
        );
      },
      // 선택된 날짜를 강조하기 위한 조건 함수 설정
      selectedDayPredicate: (date) {
        return isSameDay(selectedDate, date);
      },
      // 달력의 시작 날짜와 마지막 날짜 설정
      firstDay: DateTime(2000, 1, 1),
      lastDay: DateTime(2200, 1, 1),
      // 현재 날짜를 기준으로 달력 표시
      focusedDay: DateTime.now(),
      // 달력 헤더의 스타일 설정
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
      ),
    );
  }
}