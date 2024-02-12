// 게시물 목록 표시

import 'package:flutter/material.dart';
import 'package:farmworld_2/community/communityDB.dart';
import 'package:farmworld_2/community/postListProvider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'postDetailPage.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  PostState createState() => PostState();
}

class PostState extends State<PostPage> {
  // 검색어
  String searchText = '';

  // 플로팅 액션 버튼을 이용하여 항목을 추가할 제목과 내용
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  // 게시물 리스트 저장 변수
  List items = [];

  // 게시물 리스트 출력
  Future<void> getPostList() async {
    List postList = [];
    // DB에서 메모 정보 호출
    var result = await selectPostAll();

    print(result?.numOfRows);

    // 게시물 리스트 저장(현재는 본인 게시물만 포함됨 : 수정 필요)
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

    print('MemoMainPage - getMemoList : $postList');
    // context.read<PostUpdator>().updateList(postList);
  }

  @override
  void initState() {
    // initState 구현하기! : 수정 필요
    super.initState();
    getPostList();
  }

  // 리스트뷰 카드 클릭 이벤트
  void cardClickEvent(BuildContext context, int index) async {
    dynamic content = items[index];
    print('content : $content');
    // 게시물 리스트 업데이트 확인 변수 (true : 업데이트 됨, false : 업데이트 안 됨)
    var isPostUpdate = await Navigator.push(
      context,
      MaterialPageRoute(
        // 정의한 ContentPage의 폼 호출
        builder: (context) => ContentPage(content: content),
      ),
    );

    // 게시물 수정이 일어날 경우, 게시물 메인 페이지의 리스트 새로고침
    if (isPostUpdate != null) {
      setState(() {
        getPostList();
        items = Provider.of<PostUpdator>(context, listen: false).postList;
      });
    }
  }

  // 플로팅 액션 버튼 클릭 이벤트
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
                maxLines: null,
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
                String Title = titleController.text;
                String Content = contentController.text;
                // 게시물 추가
                await addPost(Title, Content);

                setState(() {
                  // 게시물 리스트 새로고침
                  print("PostMainPage - addPost/setState");
                  getPostList();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                // 게시물 수정이 일어날 경우 게시물 리스트 새로고침
                items = context.watch<PostUpdator>().postList;

                // 게시물이 없을 경우의 페이지
                if (items.isEmpty) {
                  return const Center(
                    child: Text(
                      "No Post",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
                // 게시물이 있을 경우의 페이지
                else {
                  // items 변수에 저장되어 있는 모든 값 출력
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      // 게시물 정보 저장
                      dynamic postInfo = items[index];
                      String userName = postInfo['userName'];
                      String postTitle = postInfo['postTitle'];
                      String postContent = postInfo['postContent'];
                      String createDate = postInfo['createDate'];
                      String updateDate = postInfo['updateDate'];

                      // 검색 기능 : 검색어가 있을 경우, 제목으로만 검색
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => addItemEvent(context),
        tooltip: 'Add Post',
        child: const Icon(Icons.add),
      ),
    );
  }
}
