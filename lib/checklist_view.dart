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
  List<String> checkList = [];

  void _loadTodoList() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      todoList = pref.getStringList('todoList') ?? [];
      checkList = pref.getStringList('checkList') ?? [];
    });
  }

  void _addTodoList(value) async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      todoList.add(value);
      checkList.add('0');
      pref.setStringList('todoList', todoList);
      pref.setStringList('checkList', checkList);
      controller.text = '';
    });
  }

  void _checkTodoList(index) async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      checkList[index] = ((int.parse(checkList[index])+1)%2).toString();
      pref.setStringList('checkList', checkList);
    });
  }

  void _deleteTodoList(index) async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      todoList.removeAt(index);
      checkList.removeAt(index);
      pref.setStringList('todoList', todoList);
      pref.setStringList('checkList', checkList);
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
            return ChecklistItem(text: todoList[index], isChecked: checkList[index]=='1', checkCallback: () {_checkTodoList(index);}, deleteCallback: () {_deleteTodoList(index);});
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