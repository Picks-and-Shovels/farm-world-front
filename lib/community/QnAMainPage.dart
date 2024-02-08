// Q&A 게시판

// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:farmworld_community/community/communityDB.dart';
import 'package:farmworld_community/community/postListProvider.dart';
import 'package:provider/provider.dart';

import 'postDetailPage.dart';

class MyQnAPage extends StatefulWidget {
  const MyQnAPage({super.key});

  @override
  MyPostState createState() => MyPostState();
}

class MyPostState extends State<MyQnAPage> {
  // 검색어
  String searchText = '';

  // 플로팅 액션 버튼을 이용하여 항목을 추가할 제목과 내용
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  // 메모 리스트 저장 변수
  List items = [];

  // 메모 리스트 출력
  Future<void> getPostList() async {
    List postList = [];
    // DB에서 메모 정보 호출
    var result = await selectPostAll();
    print(result?.numOfRows);

    // 메모 리스트 저장
    for (final row in result!.rows) {
      var postInfo = {
        'id': row.colByName('id'),
        'userIndex': row.colByName('userIndex'),
        'userName': row.colByName('userName'),
        'postTitle': row.colByName('postTitle'),
        'postContent': row.colByName('postContent'),
        'createDate': row.colByName('createDate'),
        'updateDate': row.colByName('updateDate')
      };
      postList.add(postInfo);
    }

    print('PostMainPage - getPostList : $postList');
    context.read<PostUpdator>().updateList(postList);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostList();
  }

  // 리스트뷰 카드 클릭 이벤트
  void cardClickEvent(BuildContext context, int index) async {
    dynamic content = items[index];
    print('content : $content');
    // 메모 리스트 업데이트 확인 변수 (false : 업데이트 되지 않음, true : 업데이트 됨)
    var isPostUpdate = await Navigator.push(
      context,
      MaterialPageRoute(
        // 정의한 ContentPage의 폼 호출
        builder: (context) => ContentPage(content: content),
      ),
    );

    // 메모 수정이 일어날 경우, 메모 메인 페이지의 리스트 새로고침
    if (isPostUpdate != null) {
      setState(() {
        getPostList();
        items = Provider.of<PostUpdator>(context, listen: false).postList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: '검색어를 입력해주세요.',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                // 메모 수정이 일어날 경우 메모 리스트 새로고침
                items = context.watch<PostUpdator>().postList;

                // 메모가 없을 경우의 페이지
                if (items.isEmpty) {
                  return const Center(
                    child: Text(
                      "No Post",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
                // 메모가 있을 경우의 페이지
                else {
                  // items 변수에 저장되어 있는 모든 값 출력
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      // 메모 정보 저장
                      dynamic postInfo = items[index];
                      String userName = postInfo['userName'];
                      String postTitle = postInfo['postTitle'];
                      String postContent = postInfo['postContent'];
                      String createDate = postInfo['createDate'];
                      String updateDate = postInfo['updateDate'];

                      // 검색 기능, 검색어가 있을 경우, 제목으로만 검색
                      if (searchText.isNotEmpty &&
                          !items[index]['postTitle']
                              .toLowerCase()
                              .contains(searchText.toLowerCase())) {
                        return const SizedBox.shrink();
                      }
                      // 검색어가 없을 경우
                      // 혹은 모든 항목 표시
                      else {
                        return Card(
                          elevation: 3,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.elliptical(20, 20))),
                          child: ListTile(
                            leading: Text(userName),
                            title: Text(postTitle),
                            subtitle: Text(postContent),
                            trailing: Text(updateDate),
                            onTap: () => cardClickEvent(context, index),
                          ),
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
