import 'package:flutter/material.dart';

class ChecklistView extends StatefulWidget {
  @override
  State<ChecklistView> createState() => _ChecklistView();
}

class _ChecklistView extends State<ChecklistView> {
  List<String> todoList = [
    '코딩테스트 공부',
    'A과목 복습',
    'B과목 과제',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('checklist')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text(todoList[0]),
            ),
            Container(
              child: Text(todoList[1]),
            ),
            Container(
              child: Text(todoList[2])
            )
          ]
        )
      )
    );
  }
}