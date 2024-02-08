import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:riverpod/riverpod.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'package:farmworld_community/diary/models/diary_db.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    DiaryDb,
  ],
)

class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  // 지정된 날짜에 대한 다이어리 항목 조회
  Stream<List<DiaryDbData>> watchSchedules(DateTime date)
  => (select(diaryDb)..where((tbl) => tbl.date.equals(date))).watch();

// 다이어리 항목을 추가
  Future<int> createSchedule(DiaryDbCompanion date)
  => into(diaryDb).insert(date);

// 지정된 날짜의 다이어리 항목을 삭제
  Future<int> removeSchedule(DateTime date)
  => (delete(diaryDb)..where((tbl) => tbl.date.equals(date))).go();

// 지정된 날짜의 다이어리 항목을 업데이트
  Future<int> updateSchedule(DiaryDbCompanion date)
  => (update(diaryDb)..where((tbl) => tbl.date.equals(date.date.value))).write(date);
}

// 비동기적으로 데이터베이스에 연결하기 위한 LazyDatabase 생성
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path,'dbsqlite'));
    return NativeDatabase(file);
  });
}
