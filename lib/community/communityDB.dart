import 'package:farmworld_2/config/mySqlConnector.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 1. 모든 게시물 보기
Future<IResultSet?> selectPostAll() async {
  // MySQL 접속 설정
  final conn = await dbConnector();

  // 유저 식별 정보 호출
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  // DB에 저장된 게시물 리스트
  IResultSet result;

  // 유저의 모든 게시물 보기
  try {
    result = await conn.execute(
        "SELECT m.id, userIndex, u.userName, PostTitle, createDete, updateDate FROM memo AS m LEFT JOIN users AS u ON m.userIndex = u.id WHERE userIndex = :token",
        {"token": token});
    if (result.numOfRows > 0) {
      return result;
    }
  } catch (e) {
    print('Error : $e');
  } finally {
    await conn.close();
  }
  // 게시물이 없으면 null 값 반환
  return null;
}

// 2. 게시물 작성
Future<String?> addPost(String title, String content) async {
  // MySQL 접속 설정
  final conn = await dbConnector();

  // 유저 식별 정보 호출
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  // 쿼리 수행 결과 저장 변수
  IResultSet? result;

  // 유저의 아이디를 저장할 변수
  String? userName;

  // 게시물 추가
  try {
    // 유저 이름 확인
    result = await conn.execute(
      "SELECT userName FROM users WHERE id = token",
      {"token": token},
    );

    // 유저 이름 저장
    for (final row in result.rows) {
      userName = row.colAt(0);
    }

    // 게시물 추가
    result = await conn.execute(
      "INSERT INTO memo (userIndex, memoTitle, memoContent) VALUES (:userIndex, :title, :content)",
      {"userIndex": token, "title": title, "content": content},
    );
  } catch (e) {
    print('Error : $e');
  } finally {
    await conn.close();
  }
  // 예외 처리용 에러코드 '-1' 반환
  return '-1';
}

// 3. 게시물 수정
Future<void> updatePost(String id, String title, String content) async {
  // MySQL 접속 설정
  final conn = await dbConnector();

  // 유저 식별 정보 호출
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  // 쿼리 수행 결과 저장 변수
  IResultSet? result;

  // 게시물 수정
  try {
    await conn.execute(
        "UPDATE post SET potTitle = :title, postContent = :content where id = :id and userIndex = :token",
        {"id": id, "token": token, "title": title, "content": content});
  } catch (e) {
    print('Error : $e');
  } finally {
    await conn.close();
  }
}

// 4. 특정 게시물 조회
Future<IResultSet?> selectPost(String id) async {
  // MySQL 접속 설정
  final conn = await dbConnector();

  // 유저 식별 정보 호출
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  // 쿼리 수행 결과 저장 변수
  IResultSet? result;

  // 게시물 수정
  try {
    result = await conn.execute(
        "SELECT m.id, userIndex, u.userName, postTitle, postContent, updateDate FROM post AS m LEFT JOIN users AS u ON m.userIndex = u.id WHERE userIndex = :token and m.id = :id",
        {"token": token, "id": id});
    return result;
  } catch (e) {
    print('Error : $e');
  } catch (e) {
    print('Error : $e');
  } finally {
    await conn.close();
  }
  return null;
}

// 5. 특정 게시물 삭제
Future<void> deletePost(String id) async {
  // MySQL 접속 설정
  final conn = await dbConnector();

  // 게시물 수정
  try {
    await conn.execute("DELETE FROM post WHERE id = :id", {"id": id});
  } catch (e) {
    print('Error : $e');
  } finally {
    await conn.close();
  }
}
