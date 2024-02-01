// 선택한 게시물의 내용을 보여 줌

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:farmworld_2/community/communityDB.dart';
import 'package:farmworld_2/community/postListProvider.dart';
import 'package:farmworld_2/community/postMainPage.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatefulWidget {
  // 생성자 초기화
  final dynamic content;
  const ContentPage({Key? key, required this.content}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentState(content: content);
}

class _ContentState extends State<ContentPage> {
  // 부모에게서 받은 생성자 값 초기화
  final dynamic content;
  _ContentState({required this.content});

  // 게시물의 정보를 저장할 변수
  List postInfo = [];

  // 앱 바 수정 버튼을 통해 제목과 내용 수정
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  // 앱 바 수정 버튼 클릭 이벤트
  Future<void> updateItemEvent(BuildContext context) {
    // 앱 바 수정 버튼을 통해 제목과 내용 수정
    TextEditingController titleController =
        TextEditingController(text: postInfo[0]['postTitle']);
    TextEditingController contentController =
        TextEditingController(text: postInfo[0]['postContent']);

    // 다이얼로그 폼 열기
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Modify'),
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
              child: const Text('Modify'),
              onPressed: () async {
                String postTitle = titleController.text;
                String postContent = contentController.text;

                Navigator.of(context).pop();

                print('postTitle : $postTitle');
                // 게시물 수정
                await updatePost(content['id'], postTitle, postContent);

                // 업데이트 된 게시물 정보 호출
                updateRefresh();

                // 게시물 내용 업데이트
                setState(() {
                  postInfo = context.watch<PostUpdator>().postList;
                });
              },
            ),
          ],
        );
      },
    );
  }

  // 게시물 삭제
  void deleteItemEvent(BuildContext context) {
    deletePost(postInfo[0]['id']);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PostPage(),
      ),
    );
  }

  // 게시물 수정시 화면 새로고침
  Future<void> updateRefresh() async {
    List postList = [];
    // DB에서 게시물 정보 호출
    var result = await selectPost(content['id']);

    // 특정 게시물 정보 저장
    for (final row in result!.rows) {
      var post = {
        'id': row.colByName('id'),
        'userIndex': row.colByName('userIndex'),
        'userName': row.colByName('userName'),
        'postTitle': row.colByName('postTitle'),
        'postContent': row.colByName('postContent'),
        'createDate': row.colByName('createDate'),
        'updateDate': row.colByName('updateDate')
      };
      postList.add(post);
    }
    print("post update : $postList");
    context.read<PostUpdator>().updateList(postList);
  }

  @override
  void initState() {
    // (구현 필요)
    super.initState();
    var post = {
      'id': content['id'],
      'userIndex': content['userIndex'],
      'userName': content['userName'],
      'postTitle': content['postTitle'],
      'postContent': content['postContent'],
      'createDate': content['createDate'],
      'updateDate': content['updateDate'],
    };
    List postList = [];
    postList.add(post);

    // 빌드가 완료된 후 Provider의 데이터 읽기
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostUpdator>().updateList(postList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 좌측 상단 뒤로 가기 버튼
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, 1);
          },
        ),
        title: const Text('게시물 상세 보기'),
        actions: [
          IconButton(
            onPressed: () => updateItemEvent(context),
            icon: const Icon(Icons.edit),
            tooltip: "Modify Post",
          ),
          IconButton(
            onPressed: () => deleteItemEvent(context),
            icon: const Icon(CupertinoIcons.delete_solid),
            tooltip: "Delete Post",
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Builder(builder: (context) {
            // 특정 게시물 정보 출력
            postInfo = context.watch<PostUpdator>().postList;

            return Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    Text(
                      postInfo[0]['postTitle'],
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('Name : ${postInfo[0]['userName']}')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('Date : ${postInfo[0]['createDate']}')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Update Date : ${postInfo[0]['updateDate']}')
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Text(
                            postInfo[0]['postContent'],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
