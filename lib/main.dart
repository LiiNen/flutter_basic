import 'package:flutter/material.dart';
import 'package:flutter_basic_lecture/checklist_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'My flutter app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _moveView() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChecklistView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _moveView,
          child: Container(
            width: 40,
            height: 40,
            child: const Text('move'),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            )
          )
        )
      )
    );
  }
}
