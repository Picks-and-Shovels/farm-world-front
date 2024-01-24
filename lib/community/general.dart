import 'package:flutter/material.dart';
import 'package:farmworld_2/listItem.dart';

class general extends StatelessWidget {
  final List<post>? list;
  const general({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(
              itemBuilder: (context, position) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        list![position].imagePath!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text(list![position].Name!)
                    ],
                  ),
                );
              },
              itemCount: list!.length),
        ),
      ),
    );
  }
}
