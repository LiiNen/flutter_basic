import 'package:flutter/material.dart';
import 'package:flutter_basic_lecture/checklist_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChecklistView extends StatefulWidget {
  @override
  State<ChecklistView> createState() => _ChecklistView();
}

class _ChecklistView extends State<ChecklistView> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<String> todoList = [];

  void _loadTodoList() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      todoList = pref.getStringList('todoList') ?? [];
    });
  }

  void _addTodoList(value) async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      todoList.add(value);
      pref.setStringList('todoList', todoList);
      controller.text = '';
    });
  }

  void _deleteTodoList(index) async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      todoList.removeAt(index);
      pref.setStringList('todoList', todoList);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('checklist')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List<Widget>.generate(todoList.length, (index) {
            return ChecklistItem(text: todoList[index], callback: () {_deleteTodoList(index);});
          }) + <Widget>[
            TextField(
              controller: controller,
              focusNode: focusNode,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) => {setState(() {_addTodoList(value);})},
            )
          ]
        )
      )
    );
  }
}