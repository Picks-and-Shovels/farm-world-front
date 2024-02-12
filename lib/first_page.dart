import 'package:auto_route/auto_route.dart';
import 'package:farmworld_2/community/QnA.dart';
import 'package:farmworld_2/community/general.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[general(), QnA()],
      ),
      bottomNavigationBar: TabBar(
        tabs: const <Tab>[
          Tab(
            icon: Icon(Icons.looks_one, color: Colors.blue),
          ),
          Tab(
            icon: Icon(Icons.looks_two, color: Colors.blue),
          )
        ],
        controller: controller,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/second');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
